//
//  ProfileView.swift
//  Tally Me
//
//  Created by Abdul Moiz on 15/06/2024.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) var colourScheme
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle((colourScheme == .dark ? .white : .black))
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                
                Section("General") {
                    HStack {
                        SettingsRowView(imageName: "gear", title: "Version", tintColour: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
                
                Section("Account") {
                    Button {
                        viewModel.signOut()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColour: .red)
                    }
                    
                    Button {
                        print("Delete Account...")
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete account", tintColour: .red)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
