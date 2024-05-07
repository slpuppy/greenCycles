//
//  ResetPasswordFeedbackView.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import SwiftUI

import SwiftUI

struct ResetPasswordFeedbackView: View {
    var body: some View {
        
        VStack{
        
        Image("growin")
            .resizable()
            .scaledToFit()
            .padding(.leading, 50)
            .padding(.trailing, 50)
            .padding(.bottom, 30)
            .padding(.top, 20)
            
            Spacer()
        
            Text("An email has been sent to you")
            .font(.system(size: 22,
                          weight: .bold,
                          design: .default))
            .foregroundColor(Color("mainGreen"))
            .padding()
        
            NavigationLink(value: "signIn", label: {
            
            ZStack{
                Rectangle()
                    .cornerRadius(15)
                    .foregroundColor(Color("mainGreen"))
                    .frame(maxHeight: 60)
                  
                Text("Back to login").font(.system(size: 18))
                    .foregroundColor(Color.white)
            
            }.padding([.leading, .trailing], 20)})
        
        }.navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Email Sent")
        }
    }


struct ResetFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordFeedbackView()
    }
}
