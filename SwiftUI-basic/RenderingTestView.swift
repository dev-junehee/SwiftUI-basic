//
//  RenderingTestView.swift
//  SwiftUI-basic
//
//  Created by junehee on 8/27/24.
//

import SwiftUI

/**
 1) 버튼 클릭 시 단순 print 출력. State 없을 때 -
 2) 버튼 클릭 시 State가 변경되지만, View에 반영되지 않을 때 -
 3) 버튼 클릭 시 State가 변경되고 View에 반영될 때 -
 4) CustomModifier 설정했을 때와 직접 View에 Modifier를 설정했을 때 결과가 다른 이유
 */
struct RenderingTestView: View {
    /// 상태 프로퍼티, Source of Truth
    /// State는 해당 뷰의 데이터를 관리하기 때문에 private 처리를 권장 (WWDC)
    @State private var number = 10
    /// State가 변경될 때 View가 렌더링된다 XXX
    /// 변경된 State가 어딘가에서 쓰일 때
    
    init() {
        print("Rendering View Init")
    }
    
    private func randomColor() -> Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
    
    var body: some View {
        VStack {
            Text("Jack")
                .font(.largeTitle)
                .background(randomColor())
                // .modifier(PrimaryText())    /// 매번 인스턴스를 호출하는 방법
                // .asPrimaryText()            /// Custom Modirier
            bran()
            den
            Hue()
            
            Button("확인: \(number)") {
                number += 1
                print("click >>", number)
            }
            .font(.title)
        }
    }
    
    var den: some View {
        Text("Den")
            // .asPrimaryText()
            .font(.largeTitle)
            .background(randomColor())
    }
    
    func bran() -> some View {
        Text("Bran")
            // .asPrimaryText()
            .font(.largeTitle)
            .background(randomColor())
    }
}

#Preview {
    RenderingTestView()
}

struct Hue: View {
    var body: some View {
        Text("Hue")
            // .asPrimaryText()
            .font(.largeTitle)
            .background(randomColor())
    }
    
    init() {
        print("Hue View Init")
    }
    
    private func randomColor() -> Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
}
