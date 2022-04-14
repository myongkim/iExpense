//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Isaac Kim on 4/13/22.
//

import Foundation

// add identifiable and add UUID, since we add the identifiable , we don't need id in Foreach
struct ExpenseItem: Identifiable, Codable, Equatable {
    // cfreate id when use the struct
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
}
