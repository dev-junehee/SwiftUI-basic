//
//  TossView.swift
//  SwiftUI-basic
//
//  Created by junehee on 8/22/24.
//

import SwiftUI

/**
 `Modifier`
 1) 순서에 따라 결과물이 다르다
    - 같은 모디파이어를 적용한다고 해서 같은 결과물이 나오는 것은 아니다.
    - `padding` vs `background` 이슈는 매번 뷰를 새롭게 반환하는 모디파이어의 특성에서 비롯된 것 >>> iOS 16+ 오류 수정됨!
 2) 우선순위 존재한다
    - 요소와 가까운 모디파이어가 우선 적용된다.
 3) 대체 vs 누적
    - padding, blur... 값이 누적된다.
    - font, foregroundStyle... 값이 대체된다.
    - background는 정확히 말하면 누적되는 것. 눈에 보이지 않아서 대체되어 보이지만, 적용은 되었으나 가장 뒷배경에 적용되기 때문에 보이지 않는 상태. (패딩을 추가하면 확인 가능)
 */
struct TossView: View {
    var body: some View {
        HStack {
            Text("안녕")
                .padding()
                .padding()
                .padding()          /// 패딩이 누적된다.
                .background(.gray)
                .blur(radius: 1)
                .blur(radius: 5)
                .blur(radius: 10)   /// 블러가 누적된다.
            Text("안녕")
                // .font(.title)
                // .font(.caption)
                // .background(.yellow)
                // .background(.red)        /// background - (공식문서) "뒤쪽에 적용된다" 즉 red 색이 적용되었지만 보이지 않는 상태.
                // .foregroundStyle(.red)
                // .foregroundStyle(.blue)
        }
        HStack {
            Text("Hello, World!")
                .background(.yellow)
                .padding()
                // .background(.red)   /// 덮어써지는 게 아니라 패딩이 추가된 배경에 또 다시 색이 추가되는 것
                .border(.black, width: 1)
            Text("Hello, World!")
                .border(.black, width: 1)
                .padding()
                .background(.yellow)
            Text("Hello, World!")
                .background(.yellow)    /// View에 해당
                .font(.caption)         /// Text에 해당 (View보다 좁은 범위에 적용되는 모디파이어) >>> iOS 16 이전에는 이런 순서가 올바르지 않으면 오류가 발생했지만 iOS 16 이후로 개선
                
        }
        .font(.title)
    }
}

#Preview {
    TossView()
}
