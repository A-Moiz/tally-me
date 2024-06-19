//
//  Tab.swift
//  Tally Me
//
//  Created by Abdul Moiz on 19/06/2024.
//

import Foundation

enum Tab: String, CaseIterable {
    case home = "Home"
    case profile = "Profile"
    
    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .profile:
            return "person"
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}
