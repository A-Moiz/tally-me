//
//  SettingsRowView.swift
//  Tally Me
//
//  Created by Abdul Moiz on 18/06/2024.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintColour: Color
    @Environment(\.colorScheme) var colourScheme
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundStyle(tintColour)
            
            Text(title)
                .font(.subheadline)
                .foregroundStyle((colourScheme == .dark ? .white : .black))
        }
    }
}

#Preview {
    SettingsRowView(imageName: "gear", title: "Version", tintColour: Color(.systemGray))
}
