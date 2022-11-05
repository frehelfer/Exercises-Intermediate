//
//  ContentView.swift
//  FileManager
//
//  Created by Frédéric Helfer on 04/11/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                
                Button {
                    //
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(.blue)
                        .cornerRadius(10)
                }

                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
