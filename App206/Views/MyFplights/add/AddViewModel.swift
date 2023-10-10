//
//  AddViewModel.swift
//  App206
//
//  Created by IGOR on 19/09/2023.
//

import SwiftUI
import CoreData

final class AddViewModel: ObservableObject {
    
    @Published var cityFrom: String = ""
    @Published var cityTo: String = ""
    @Published var airportFrom: String = ""
    @Published var airportTo: String = ""
    @Published var price: String = ""
    @Published var departure: Date = Date()
    @Published var distance: String = ""
    
    @AppStorage("dist") var dist: Int = 0
    
    func addToHistory(completion: @escaping () -> (Void)) {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let flight = NSEntityDescription.insertNewObject(forEntityName: "HistoryModel", into: context) as! HistoryModel
        
        flight.cityFrom = cityFrom
        flight.cityTo = cityTo
        flight.airportTo = airportTo
        flight.departure = departure
        flight.airportFrom = airportFrom
        flight.distance = Int32(distance) ?? 0
        flight.identity = Int16.random(in: 1...9999)
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
}
