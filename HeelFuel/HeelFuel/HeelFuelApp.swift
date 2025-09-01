//
//  HeelFuelApp.swift
//  HeelFuel
//
//  Created by William Wang on 9/1/25.
//

import SwiftData
import SwiftUI

@main
struct HeelFuelApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ItemModel.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
