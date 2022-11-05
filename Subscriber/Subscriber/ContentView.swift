//
//  ContentView.swift
//  Subscriber
//
//  Created by Frédéric Helfer on 04/11/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
            
            TextField("Type something here..", text: $vm.textFieldText)
                .font(.headline)
                .padding(.leading)
                .frame(height: 55)
                .background(Color.gray.opacity(0.4).cornerRadius(10))
                .foregroundColor(vm.textIsValid ? .green : .red)
                .overlay(alignment: .trailing) {
                    ZStack {
                        Image(systemName: vm.textIsValid ? "checkmark" : "xmark")
                            .foregroundColor(vm.textIsValid ? .green : .red)
                            .opacity(vm.textFieldText.count < 1 ? 0.0 : 1.0)
                    }
                    .font(.headline)
                    .padding(.trailing)
                }
            Button(action: {}, label: {
                Text("Submit".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
                    .opacity(vm.showButton ? 1.0 : 0.5)
            })
                .disabled(!vm.showButton)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
