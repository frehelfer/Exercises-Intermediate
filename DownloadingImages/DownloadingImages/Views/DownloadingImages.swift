//
//  DownloadingImages.swift
//  DownloadingImages
//
//  Created by Frédéric Helfer on 07/11/22.
//

import SwiftUI

struct DownloadingImages: View {
    @StateObject var vm = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray) { model in
                    DownloadingImagesRow(model: model)
                }
            }
            .navigationTitle("Downloading Images!")
        }
    }
}

struct DownloadingImages_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImages()
    }
}
