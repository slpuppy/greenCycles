//
//  CycleCell.swift
//  Cycles
//
//  Created by Gabriel Puppi on 08/05/24.
//

import SwiftUI

struct CycleCell: View {
    
   // @StateObject var cell: Cycle
    
    var body: some View {
            VStack{
                HStack(alignment: .center, content: {
                    Image(systemName: "leaf.arrow.triangle.circlepath")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color("mainGreen"))
                    Text("CBD Compassion Lime")
                        .font(.system(size: 22, weight: .bold))
                        .padding(.leading, 8)
                    Spacer()
                })
                HStack{
                    Text("Not Started")
                    Spacer()
                }
            }.padding()
        .background(Color(.white))
        
    }
}

#Preview {

    CycleCell()
}
