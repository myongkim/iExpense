//
//  Expenses.swift
//  iExpense
//
//  Created by Isaac Kim on 4/13/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    var personalItems: [ExpenseItem] {
        items.filter { $0.type == "Personal" }

    }
    var businessItems: [ExpenseItem] {
        items.filter { $0.type == "Business" }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodeditems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodeditems
                return
            }
        }
        items = []
        
    }
    
}
