//
//  UserCyclesView.swift
//  Cycles
//
//  Created by Gabriel Puppi on 07/05/24.
//

import SwiftUI

struct UserCyclesView: View {
    
    @StateObject private var viewModel = UserCyclesViewModel()
   
    var body: some View {
        ZStack {
            Color(.systemGray6)
                    VStack {
                        CyclesHeaderView()
                        ScrollView {
                            if viewModel.cycles.count > 0 {
                                ForEach(viewModel.cycles) { cycle in
                                    CycleCell()
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .padding([.leading, .trailing])
                                        .padding(.bottom, 8)
                                }
                            } else {
                                Text("No cycles grown")
                            }
                        }
                        RoundedButton(action: {
                            Task {
                               viewModel.createNewCycle()
                            }
                          
                        }, label: "Create new cycle", backgroundColor: Color("mainGreen"), titleColor: .white, strokeColor: .clear)
                        .padding([.bottom, .top])
                        .background(.white)
                    }
                    .background(Color(.clear))
                    .onAppear() {
                        self.viewModel.setup()
                        self.viewModel.fetchUserCycles()
                    }
        }
    }
}


#Preview {
    UserCyclesView()
}
