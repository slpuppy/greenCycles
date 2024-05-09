//
//  CylesHeaderView.swift
//  Cycles
//
//  Created by Gabriel Puppi on 08/05/24.
//

import SwiftUI

struct CyclesHeaderView: View {
    var body: some View {
        VStack{
            Text("Hello grower")
                .font(.system(size: 36, weight: .medium, design: .monospaced))
                .padding(.top, 24)
                .padding(.bottom, 36)
            HStack{
                Text("Current cycles:")
                    .fontWeight(.medium)
                Spacer()
            }.padding(.leading)
        }
      }
}

#Preview {
    CyclesHeaderView()
}
