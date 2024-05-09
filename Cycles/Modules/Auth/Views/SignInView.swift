//
//  WelcomeView.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//


import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var viewModel: AuthViewModel
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            Image("growin")
                .resizable()
                .scaledToFit()
                .padding(.leading, 100)
                .padding(.trailing, 100)
                .padding(.top, 100)
            
            Spacer()
                
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
            
            Button(action: {
                router.navigate(to: .resetPassword)
            }, label:{
                
                Text("Forgot your password ? Click here")
                    .font(.system(size: 14))
               
               .foregroundColor(Color("lightGreen"))
                
                
            }).padding(.bottom, 20)
            
            Spacer()
           
            Button(action: {
                guard !email.isEmpty, !password.isEmpty else {
                    return
                }
                Task {
                    await viewModel.signIn(email: email, password: password)
                }
            }, label: {
                
                ZStack{
                    Rectangle()
                        .cornerRadius(15)
                        .foregroundColor(Color("mainGreen"))
                        .frame(maxHeight: 60)
                      
                    Text("Sign In").font(.system(size: 18))
                        .foregroundColor(.white)
                }})
            
            Button(action: {
                router.navigate(to: .signUp)
            } , label: {
                
                Text("Don't have an account yet? Sign Up").font(.system(size: 16))
                    .underline()
                    .foregroundColor(Color("mainGreen"))
                    .padding(.top, 8)
            })
        }.padding()
            .navigationTitle("Sign In")
            .onReceive(viewModel.$signedIn) { signedIn in
                if signedIn {
                    router.navigateToRoot()
                }
            }
    }
}


struct SignView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
