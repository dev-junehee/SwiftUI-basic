//
//  CategoryView.swift
//  SwiftUI-basic
//
//  Created by junehee on 8/27/24.
//

import SwiftUI

/**
 `Binding`
 - 외부에서 Source of Truth를 주입 받고 참고 받는다
 - 상위 뷰가 가진 상태는 사용/수정할 수 있는 Derived Value
 */
struct CategoryView: View {
    /// `Source of Truth`
    @State private var genre = "로맨스"
    
    var body: some View {
        CategoryPresentView(text: genre)
        Text("선택한 장르: \(genre)")
        CategoryButtonView(genre: $genre)    /// 하위 뷰
        /// $를 붙이는 이유 - @State, @Binding => Property Wrapper => Projected Value
    }
}

#Preview {
    CategoryView()
}

struct CategoryPresentView: View {
    /// 하위뷰에서 반드시 @Binding을 사용해야하는 것이 아니라, 하위뷰에서 State 값의 수정이 필요할 때 사용
    /// 단순히 보여주는 용도는 property를 받아서 사용하면 된다.
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title)
    }
}

struct CategoryButtonView: View {
    /// `Derived Data` (실제 source of truth는 따로 있고, 바인딩만 해주는 역할)
    @Binding var genre: String
    
    var body: some View {
        HStack {
            Button("로맨스") {
                genre = "로맨스"
            }
            Button("액션") {
                genre = "액션"
            }
            Button("스릴러") {
                genre = "스릴러"
            }
        }
    }
}
