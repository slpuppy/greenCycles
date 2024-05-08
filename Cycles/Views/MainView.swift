//
//  MainView.swift
//  Cycles
//
//  Created by Gabriel Puppi on 07/05/24.
//

import SwiftUI

enum Tabs: String {
    case cycles = "Growing Cycles"
    case config = "Settings"
    case community = "Community"
}

struct MainView: View {
    
    @State var selectedTab: Tabs = .cycles
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        TabView(selection: $selectedTab) {
            UserCyclesView()
                .tabItem {
                    Image(systemName: "house.fill")
                }.tag(Tabs.cycles)
            
            CommunityView()
                .tabItem { Image(systemName: "tree.fill") }
                .tag(Tabs.community)
            
            SettingsView()
                .tabItem { Image(systemName: "gearshape")
                }.tag(Tabs.config)
        }.accentColor(Color("mainGreen"))
    }
}

#Preview {
    MainView()
}
