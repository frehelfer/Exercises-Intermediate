//
//  ViewModel.swift
//  Escaping
//
//  Created by Frédéric Helfer on 01/11/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var text: String = "Hello"
    
    func getData() {
//        downloadData3 { [weak self] (returnedData) in
//            self?.text = returnedData
//        }
        
        downloadData5 { [weak self] returnetData in
            self?.text = returnetData.data
        }
    }
    
    func downloadData() -> String {
        return "New Data!"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> ()) {
        completionHandler("New Data!")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler("New Data!")
        }
    }
    
    func downloadData4(completionHandler: @escaping (_ data: DownloadResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            let result = DownloadResult(data: "New Data!")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            let result = DownloadResult(data: "New Data!")
            completionHandler(result)
        }
    }
}
