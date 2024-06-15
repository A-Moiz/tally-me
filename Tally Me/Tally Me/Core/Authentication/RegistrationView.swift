//
//  RegistrationView.swift
//  Tally Me
//
//  Created by Abdul Moiz on 15/06/2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.colorScheme) var colourScheme
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // image
                Image("app-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.vertical, 32)
                    .clipShape(Circle())
                
                // form fields
                VStack(spacing: 24) {
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                        .textInputAutocapitalization(.none)
                    
                    InputView(text: $fullname, title: "Full Name", placeholder: "Enter your name")
                    
                    InputView(text: $password, title: "Password", placeholder: "Create a password", isSecureField: true)
                    
                    InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign up button
                Button {
                    print("Sign user up")
                } label: {
                    HStack {
                        Text("Sign up")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    //.foregroundStyle(colourScheme == .dark ? .white : .black)
                    .foregroundStyle(.orange)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                //.background(Color(.systemOrange))
                .background(colourScheme == .dark ? .white : .black)
                .cornerRadius(10)
                .padding(.vertical, 24)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    VStack(spacing: 15) {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width, height: 1)
                            .foregroundColor(.gray)
                        HStack {
                            Text("Already have an account?")
                            Text("Sign in")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                        .foregroundStyle(.orange)
                    }
                }
            }
            .navigationTitle("Create account")
        }
    }
}

#Preview {
    RegistrationView()
}
