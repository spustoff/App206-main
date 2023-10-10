//
//  MyFlightsViewModel.swift
//  App206
//
//  Created by IGOR on 19/09/2023.
//

import SwiftUI
import CoreData

final class MyFlightsViewModel: ObservableObject {
    
    @Published var current_history: HistoryModel?
    @Published var history: [HistoryModel] = []
    @Published var isDetail: Bool = false
    @Published var isFavs: Bool = false
    @Published var isAdd: Bool = false
    
    @AppStorage("saved_history") var saved_history: [String] = []
    
    func getItems() -> [HistoryModel] {
        
        switch isFavs {
            
        case true:
            return history.filter{saved_history.contains($0.cityTo ?? "")}
        case false:
            return history
        }
    }
    
    func fetchHistory() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<HistoryModel>(entityName: "HistoryModel")

        do {
            
            let persons = try context.fetch(fetchRequest)
            
            self.history = persons
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.history = []
        }
    }
}

