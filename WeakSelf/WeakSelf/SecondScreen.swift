//
//  SecondScreen.swift
//  WeakSelf
//
//  Created by Frédéric Helfer on 01/11/22.
//

import SwiftUI

struct SecondScreen: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
                .foregroundColor(.red)
            
            if let data = vm.data {
                Text(data)
            }
        }
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
    }
}
