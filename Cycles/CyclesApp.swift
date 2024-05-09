//
//  CyclesApp.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import SwiftUI
import FirebaseCore



@main
struct CyclesApp: App {
    
    init(){
        
          FirebaseApp.configure()
    }
    
    @ObservedObject var router = Router()
    @ObservedObject var authVM = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                if AuthManager.shared.isSignedIn {
                    MainView()
                } else {
                    InitialView()
                        .navigationDestination(for: Router.Screen.self) { screen in
                            switch screen {
                            case .signIn:
                                SignInView()
                            case .signUp:
                                SignUpView()
                            case .resetPassword:
                                ResetPasswordView()
                            case .resetPasswordFeedback:
                                ResetPasswordFeedbackView()
                            }
                        }
                }
               }.accentColor(Color("mainGreen"))
                 .environmentObject(router)
                 .environmentObject(authVM)
                 .onAppear {
                     authVM.setup()
                 }
            
        }
    }
}
