//
//  ViewModel.swift
//  FileManager
//
//  Created by Frédéric Helfer on 04/11/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var image: UIImage?
    let imageName: String = "Example"
    let manager = LocalFileManager.instance 
    
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
}
