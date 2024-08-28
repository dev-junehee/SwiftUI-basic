//
//  RadiusBlackBackground.swift
//  SwiftUI-basic
//
//  Created by junehee on 8/22/24.
//

import SwiftUI


/// Extension에서만 활용하고 있기 때문에 외부에서 볼 수 없도록 private 처리
private struct RadiusBlackBackground: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .asForeground(color)
            .padding()
            .background(.black)
            .clipShape(.capsule)
    }
    
}

extension View {
    
    /// `as`: 내가 만든 거라는 의미. WWDC에서도 이렇게 소개함!
    func asRadiusBlackBackground(color: Color) -> some View {
        modifier(RadiusBlackBackground(color: color))
    }
    
}
