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
    @EnvironmentObject var viewModel: AuthViewModel
    
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
                    
                    ZStack(alignment: .trailing) {
                        InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
                        
                        if (!password.isEmpty && !confirmPassword.isEmpty) {
                            if password == confirmPassword {
                                Image(systemName: "checkmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color(.systemGreen))
                            } else {
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color(.systemRed))
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign up button
                Button {
                    Task { try await viewModel.createUser(withEmail: email, password: password, fullname: fullname) }
                } label: {
                    HStack {
                        Text("Sign up")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.orange)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(colourScheme == .dark ? .white : .black)
                .cornerRadius(10)
                .padding(.vertical, 24)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                
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

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@")  && (email.contains(".com") || email.contains(".co.uk") || email.contains(".ac.uk") || email.contains(".org") || email.contains(".net")) && !password.isEmpty && password.count > 5 && confirmPassword == password && !fullname.isEmpty
    }
}

#Preview {
    RegistrationView()
}
