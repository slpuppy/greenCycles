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
    
    @State var passwordResetEmail: String = ""
    
 //   @Environment(\.presentationMode) var presentationMode
    
    @State var feedbackSheet = false
    
//    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack{
            
            
            Text("Enter the email of your account").padding().font(.system(size: 16, weight: .semibold, design: .default))
            
            TextField("Account email", text: $passwordResetEmail)
                .padding()
                .background(Color("mainBlu")).opacity(0.5)
                .cornerRadius(15.0)
                .padding(.bottom, 10)
            
            
            Button(action:{
                
//                viewModel.sendPasswordReset(withEmail: passwordResetEmail) { error in
//                    
//                    if error != nil {
//                        
//                        print("error sending email")
//                        
//                    } else if error == nil {
//                        
//                        print ("email sent")
//                        feedbackSheet.toggle()
//                    }
//                    
//                }
            }, label: {
                
                ZStack{
                    Rectangle()
                        .cornerRadius(15)
                        .foregroundColor(Color("mainPink"))
                        .frame(maxHeight: 60)
                      
                    Text("Send reset link").font(.system(size: 18))
                        .foregroundColor(Color.white)
                }.padding([.leading, .trailing], 20)})
                
                
        }.padding([.leading, .trailing], 20)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Reset Password")
            .sheet(isPresented: $feedbackSheet) {
                
//                ResetFeedbackView()
                
            }.background(Color("bgColor"))
        
        Spacer()
            
        
        
    
    
    
    
    
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
