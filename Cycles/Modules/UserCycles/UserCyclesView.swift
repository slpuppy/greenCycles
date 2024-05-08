//
//  UserCyclesView.swift
//  Cycles
//
//  Created by Gabriel Puppi on 07/05/24.
//

import SwiftUI

struct UserCyclesView: View {
    
    @ObservedObject var viewModel = UserCyclesViewModel()
   
    var body: some View {
        VStack{
            if viewModel.cycles.count > 0 {
                ForEach(viewModel.cycles) { cycle in
                    Text(cycle.name)
                }
            } else {
                Text("No cycles grown")
            }
            Button("Create Cycle") {
                viewModel.createNewCycle()
            }
            Button("Sign Out") {
              //  viewModel.signOut()
            }
        }.onAppear() {
            self.viewModel.fetchUserCycles()
        }
        
    }
}

#Preview {
    UserCyclesView()
}
