//
//  SampleCoreDataApp.swift
//  SampleCoreData
//
//  Created by Milana Antonova on 23.05.22.
//

import SwiftUI

@main
struct SampleCoreDataApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              dataController.container.viewContext)
        }
    }
}
