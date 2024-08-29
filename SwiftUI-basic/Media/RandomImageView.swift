//
//  RandomImageView.swift
//  SwiftUI-basic
//
//  Created by junehee on 8/29/24.
//

import SwiftUI

/// 상위 뷰
struct RandomImageView: View {
    
    @State private var number = Int.random(in: 1...100)
    
    var body: some View {
        RandomButtonView(number: $number)
        AsyncImage(url: URL(string: "https://picsum.photos/id/\(number)/200/300"))
            .frame(width: 200, height: 300)
    }
}

/// 하위 뷰
struct RandomButtonView: View {
    /// @Binding은 초기값이 없다. (외부에서 데이터를 받아오는 역할이기 때문)
    @Binding var number: Int
    
    var body: some View {
        Button(action: {
            number = Int.random(in: 1...100)
        }, label: {
            Text("이미지 다시 가져오기")
        })
    }
}

#Preview {
    RandomImageView()
}
