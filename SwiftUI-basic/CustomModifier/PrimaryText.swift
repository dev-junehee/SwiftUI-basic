//
//  PrimaryText.swift
//  SwiftUI-basic
//
//  Created by junehee on 8/27/24.
//

import SwiftUI

private struct PrimaryText: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(randomColor())
            .cornerRadius(8.0)
    }
    
    private func randomColor() -> Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }

}

extension View {
    
    func asPrimaryText() -> some View {
        modifier(PrimaryText())
    }
    
}
