//
//  PDF_Viewer_CoreDataApp.swift
//  PDF_Viewer_CoreData
//
//  Created by KO NISHIYAMA on 2023/08/25.
//

import SwiftUI

@main
struct PDF_Viewer_CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
