//
//  ContentView.swift
//  Typealias
//
//  Created by Frédéric Helfer on 01/11/22.
//

import SwiftUI

struct ContentView: View {
//    @State var item: MovieModel = MovieModel(title: "Title", director: "Joe", count: 5)
    
    @State var item: TVModel = TVModel(title: "TVSHOW", director: "Fre", count: 10)
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
