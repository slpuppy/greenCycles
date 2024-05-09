//
//  SettingsView.swift
//  Cycles
//
//  Created by Gabriel Puppi on 07/05/24.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Button("Sign Out") {
            viewModel.signOut()
        }
    }
}

#Preview {
    SettingsView()
}
