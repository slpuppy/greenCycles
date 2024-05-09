//
//  RoundedButton.swift
//  Cycles
//
//  Created by Gabriel Puppi on 08/05/24.
//

import SwiftUI

struct RoundedButton: View {
    let action: () -> Void
    let label: String
    var backgroundColor: Color
    var titleColor: Color
    var strokeColor: Color

    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(strokeColor, lineWidth: 2)
                    )
                    .frame(maxHeight: 60)

                Text(label)
                    .font(.system(size: 18))
                    .foregroundColor(titleColor)
            }
            .padding([.leading, .trailing], 20)
            .frame(height: 50)
        }
    }
}
