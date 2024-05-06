//
//  ContentView.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import SwiftUI

struct InitialView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("growin").padding(.top, 100)
                Text("Cycles growing journal")
                    .font(.system(size:36, weight: .bold, design: .monospaced))
                    .foregroundStyle(Color("mainGreen"))
                    .multilineTextAlignment(.center)
                    .padding(.top, 120)
                    .padding([.leading, .trailing], 24)
                Text("Your growing journey made easy!")
                    .font(.system(size:18, weight: .regular))
                    .foregroundStyle(Color(.systemGray))
                    .padding(.top, 10)
                    .padding([.leading, .trailing], 24)
                
                Spacer()
                
                NavigationLink(destination: SignInView(), label: {
                    
                    ZStack{
                        Rectangle()
                            .cornerRadius(15)
                            .foregroundColor(Color("mainGreen"))
                            .frame(maxHeight: 60)
                        
                        Text("Sign In").font(.system(size: 18))
                            .foregroundColor(.white)
                    }.padding([.leading, .trailing], 20)})
                
                NavigationLink(destination: SignUpView(), label: {
                    
                    Text("Don't have an account yet? Sign Up").font(.system(size: 16))
                        .underline()
                        .foregroundColor(Color("mainGreen"))
                        .padding(.top, 8)
                })
            }
        }.accentColor(Color("mainGreen"))
    }
}


#Preview {
    InitialView()
}