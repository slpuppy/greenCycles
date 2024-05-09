//
//  WelcomeView.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//


import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var viewModel: AuthViewModel
    @State var username = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            
            Text("Let's create your Cycles account")
                .padding()
            
            TextField("Username", text: $username)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(15.0)
                .padding(.bottom, 10)
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(15.0)
                .padding(.bottom, 10)
            SecureInputView("Password", text: $password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(15.0)
                .padding(.bottom, 4)
            
            Spacer()
            
            Button(action: {
                
                guard !email.isEmpty, !password.isEmpty, !username.isEmpty else {
                    return // Add warning here
                }
                Task {
                   await viewModel.signUp(email: email, password: password, username: username)
                }
                
            }, label: {
                
                ZStack{
                    Rectangle()
                        .cornerRadius(15)
                        .foregroundColor(Color("mainGreen"))
                        .frame(maxHeight: 60)
                    
                    Text("Sign Up").font(.system(size: 18))
                        .foregroundColor(.white)
                }})
            
            Button(action:{
                router.navigate(to: .signIn)
            }, label: {
                
                Text("Already have an account? Sign In").font(.system(size: 16))
                    .underline()
                    .foregroundColor(Color("mainGreen"))
                    .padding(.top, 8)
            })
        }.padding()
        .navigationTitle("Sign Up")
        .onReceive(viewModel.$signedIn) { signedIn in
            if signedIn {
                router.navigateToRoot()
            }
        }

    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

