//
//  testestApp.swift
//  testest
//
//  Created by 林秀謙 on 2023/9/12.
//

import SwiftUI

@main
struct testestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
