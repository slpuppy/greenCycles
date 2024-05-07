//
//  ResetPasswordView.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

//
//  ResetPasswordView.swift
//  goat
//
//  Created by Gabriel Puppi on 10/10/21.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var viewModel: AuthViewModel
    @State var passwordResetEmail: String = ""
    @State var showingAlert = false
  
    
    var body: some View {
            VStack {
                Text("Enter the email of your account")
                    .padding()
                    .font(.system(size: 16, weight: .semibold, design: .default))
                
                TextField("Account email", text: $passwordResetEmail)
                    .padding()
                    .background(Color(.systemGray3)).opacity(0.5)
                    .cornerRadius(15.0)
                    .padding(.bottom, 10)
                
                Button(action: {
                    viewModel.sendPasswordReset(withEmail: passwordResetEmail) { error in
                        if error != nil {
                            print("error sending email")
                        } else {
                            print ("email sent")
                            showingAlert = true
                        }
                    }
                }, label: {
                    ZStack {
                        Rectangle()
                            .cornerRadius(15)
                            .foregroundColor(Color("mainGreen"))
                            .frame(maxHeight: 60)
                        
                        Text("Send reset link")
                            .font(.system(size: 18))
                            .foregroundColor(Color.white)
                    }
                    .padding([.leading, .trailing], 20)
                })
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Email Sent"), message: Text("An email with instructions has been sent to \(passwordResetEmail)."), dismissButton: .default(Text("OK"), action: {
                        router.navigateToRoot()
                    }))
                }
            }
            .padding([.leading, .trailing], 20)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Reset Password")
            Spacer()
    }
}


struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
