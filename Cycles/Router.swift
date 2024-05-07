//
//  Router.swift
//  Cycles
//
//  Created by Gabriel Puppi on 07/05/24.
//
import SwiftUI
import Foundation

final class Router: ObservableObject {
    
    public enum Screen: Codable, Hashable {
        case signUp
        case signIn
        case resetPassword
        case resetPasswordFeedback
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Screen) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
