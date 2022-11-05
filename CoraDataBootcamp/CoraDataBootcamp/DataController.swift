//
//  DataController.swift
//  CoraDataBootcamp
//
//  Created by Frédéric Helfer on 21/10/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntitites: [Fruit] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        
        container.loadPersistentStores { description, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<Fruit>(entityName: "Fruit")
        
        do {
            savedEntitites = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetchin. \(error)")
        }
    }
    
    func addFruit(text: String) {
        let newFruit = Fruit(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print(error)
        }
    }
    
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let fruit = savedEntitites[index]
        container.viewContext.delete(fruit)
        saveData()
    }
    
    func updateFruit(fruit: Fruit) {
        let currentName = fruit.name ?? ""
        let newName = currentName + "!"
        fruit.name = newName
        
        saveData()
    }
}
