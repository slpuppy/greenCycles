//
//  CyclesApp.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct CyclesApp: App {
    
    @ObservedObject var router = Router()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                let viewModel = AuthViewModel()
                InitialView()
                    .environmentObject(viewModel)
                    .navigationDestination(for: Router.Screen.self) { screen in
                        switch screen {
                        case .signIn:
                            SignInView()
                                .environmentObject(viewModel)
                        case .signUp:
                            SignUpView()
                                .environmentObject(viewModel)
                        case .resetPassword:
                            ResetPasswordView()
                                .environmentObject(viewModel)
                        case .resetPasswordFeedback:
                            ResetPasswordFeedbackView()
                                .environmentObject(viewModel)
                        }
                    }
                    
                }.accentColor(Color("mainGreen"))
                 .environmentObject(router)
            
        }
    }
}
