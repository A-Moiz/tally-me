//
//  ProfileView.swift
//  Tally Me
//
//  Created by Abdul Moiz on 15/06/2024.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) var colourScheme
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text("MJ")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle((colourScheme == .dark ? .white : .black))
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Michael Jordon")
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text("test@gmail.com")
                            .font(.footnote)
                            .accentColor(.gray)
                    }
                }
            }
            
            Section {
                Text("General")
            }
            
            Section {
                Text("Account")
            }
        }
    }
}

#Preview {
    ProfileView()
}
