//
//  TamagochiView.swift
//  SwiftUI-basic
//
//  Created by junehee on 8/27/24.
//

import SwiftUI

struct TamagochiView: View {
    
    /// State는 무조건 초기값이 필요
    @State private var riceText = ""
    @State private var riceCount = 0
    
    var body: some View {
        Text("밥알: \(riceCount)개")
        
        /// SwiftUI - TitleFiels, SecureField 구분하여 사용
        TextField("밥주세용", text: $riceText) /// $riceText = `@Binding`
            .padding()
            .background(.yellow.opacity(0.2))
        
        Button("밥먹기") {
            if let riceInt = Int(riceText) {
                riceCount += riceInt
                riceText = ""
            } else {
                riceCount += 1
            }
        }
    }
}

#Preview {
    TamagochiView()
}
