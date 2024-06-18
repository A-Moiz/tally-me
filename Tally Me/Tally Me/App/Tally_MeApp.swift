//
//  Tally_MeApp.swift
//  Tally Me
//
//  Created by Abdul Moiz on 15/06/2024.
//

import SwiftUI
import Firebase

@main
struct Tally_MeApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
