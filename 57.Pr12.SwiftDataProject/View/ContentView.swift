//
//  ContentView.swift
//  57.Pr12.SwiftDataProject
//
//  Created by Валентин on 07.07.2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingUpcomingOnly = false  //флаг. По умолчанию покажем все записи, если он будет true - покажем только тех, которые удовлетворяют фильтру
    
    
    var body: some View {
        NavigationStack {
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast)   //.distantPast - самая старая из возможных дат
                .navigationTitle("Users")
                .toolbar {
                    Button("Add Samples", systemImage: "plus") {
                        try? modelContext.delete(model: User.self)
                        
                        //существующие ("старые") пользователи
                        let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))    //дата добавления = 10 дней назад
                        let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))    //дата добавления = 5 дней назад
                        let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))    //дата добавления = 5 дней вперед
                        let fourth = User(name: "Jonny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))    //дата добавления = 10 дней вперед
                        
                        modelContext.insert(first)
                        modelContext.insert(second)
                        modelContext.insert(third)
                        modelContext.insert(fourth)
                        
                    }
                    
                    Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                        showingUpcomingOnly.toggle()
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
