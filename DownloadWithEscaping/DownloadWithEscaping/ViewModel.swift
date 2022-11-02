//
//  ViewModel.swift
//  DownloadWithEscaping
//
//  Created by Frédéric Helfer on 01/11/22.
//

import Foundation


class ViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        downloadData(fromURL: url) { data in
            if let data = data {
                guard let decoded = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
                
                DispatchQueue.main.async { [weak self] in
                    self?.posts = decoded
                }
            }
        }
    }
    
    func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error downloading data.")
                completionHandler(nil)
                return
            }
            
            completionHandler(data)
            
        }.resume()
    }
}
