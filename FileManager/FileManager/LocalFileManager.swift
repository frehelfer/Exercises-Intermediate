//
//  LocalFileManager.swift
//  FileManager
//
//  Created by Frédéric Helfer on 04/11/22.
//

import Foundation
import UIKit

class LocalFileManager {
    
    
    static let instance = LocalFileManager()
    
    func saveImage(image: UIImage, name: String) {
        guard let data = image.jpegData(compressionQuality: 1.0) else { return }
        
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let directory2 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        let directory3 = FileManager.default.temporaryDirectory
        
        print(directory)
        print(directory2)
        print(directory3)
        
//        data.write(to: <#T##URL#>)
    }
}
