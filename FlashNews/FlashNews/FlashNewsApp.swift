//
//  FlashNewsApp.swift
//  FlashNews
//
//  Created by Miguel Mañas Alvarez on 25/2/25.
//

import SwiftUI

@main
struct FlashNewsApp: App {
    
    @StateObject var coordinator = NewsCoordinator()
    
    var body: some Scene {
        WindowGroup {
            coordinator.start()
        }
    }
}
