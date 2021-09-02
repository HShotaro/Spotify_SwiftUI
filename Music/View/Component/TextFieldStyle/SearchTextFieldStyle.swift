//
//  SearchTextFieldStyle.swift
//  Music
//
//  Created by Shotaro Hirano on 2021/09/03.
//

import SwiftUI

struct SearchTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(6)
            .background(LinearGradient(gradient: Gradient(colors: [Color(.systemOrange), Color(.systemBackground)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(16)
            .shadow(color: .red, radius: 8)
    }
}
