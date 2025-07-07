//
//  _7_Pr12_SwiftDataProjectApp.swift
//  57.Pr12.SwiftDataProject
//
//  Created by Валентин on 07.07.2025.
//

import SwiftUI
import SwiftData

@main
struct _7_Pr12_SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
