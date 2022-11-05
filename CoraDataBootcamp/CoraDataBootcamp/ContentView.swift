//
//  ContentView.swift
//  CoraDataBootcamp
//
//  Created by Frédéric Helfer on 21/10/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = DataController()
    @State var textField = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Add fruit here", text: $textField)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button {
                    guard !textField.isEmpty else {return}
                    vm.addFruit(text: textField)
                    textField = ""
                } label: {
                     Text("Button")
                }
                .padding()
                
                List {
                    ForEach(vm.savedEntitites) { entity in
                        Text(entity.name ?? "No Name")
                            .onTapGesture {
                                vm.updateFruit(fruit: entity)
                            }
                    }
                    .onDelete(perform: vm.deleteFruit)
                }
            }
            .navigationTitle("Fruits")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
