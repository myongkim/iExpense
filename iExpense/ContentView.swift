//
//  ContentView.swift
//  iExpense
//
//  Created by Isaac Kim on 4/13/22.
//

import SwiftUI



struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    // using showingAddExpense false and make it sheet to present the view, also needs to change the expenses preview to confirm with the object.
    @State private var showingAddExpense = false
    
    
    
    var body: some View {
        NavigationView {
            
            
            List {
                ExpenseSection(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
                
                ExpenseSection(title: "Personal", expenses: expenses.businessItems, deleteItems: removePersonalItems)
                
            }
            .navigationTitle("iExpense")
            
            
            .toolbar {
                Button {
                    showingAddExpense = true
                    
                } label: {
                    Image(systemName: "plus")
                }
                
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
                
                
            }
            
            
        }
        
        
    }
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




