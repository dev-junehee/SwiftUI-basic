//
//  TossUpgradeView.swift
//  SwiftUI-basic
//
//  Created by junehee on 8/26/24.
//

import SwiftUI

/**
 Custom View => View Rendering
 1) `struct`
 2) `property`
 3) `method`
 */

struct TossUpgradeView: View {
    
    /// 뷰 내부에서만 사용할 수 있도록 private 처리 + property를 활용한 커스텀뷰
    private var cardViewWithProperty: some View {
        VStack(spacing: 10) {
            Image(systemName: "star")
            Text("토스뱅크")
        }
        .padding()
        .background(.gray.opacity(0.3))
    }
    /// method를 활용한 커스텀뷰
    private func cardViewWithFunction(image: String, text: String) -> some View {
        VStack(spacing: 10) {
            Image(systemName: image)
            Text(text)
        }
        .padding()
        .background(.blue.opacity(0.3))
    }

    var body: some View {
        /// 커스텀 뷰가 같은 뷰 파일 안에 있더라도 body안에서 커스텀뷰를 호출해주어야 한다.
        HStack {
            cardViewWithProperty
            cardViewWithProperty
            cardViewWithProperty
        }
        HStack {
            cardViewWithFunction(image: "star", text: "토스뱅크1")
            cardViewWithFunction(image: "heart", text: "토스뱅크2")
            cardViewWithFunction(image: "bookmark", text: "토스뱅크3")
        }
        
        EventView(image: "star", text: "새로운 이벤트 1")
        EventView(image: "heart", text: "새로운 이벤트 2")
        EventView(image: "bookmark", text: "새로운 이벤트 3")
    }
}

#Preview {
    TossUpgradeView()
}

/**
 만약 분리한 커스텀 뷰가 다른 뷰에서도 사용한다면 별도 코드 파일로 분리
 혹은 하나의 뷰에서만 사용한다면, 해당 뷰에서 private 처리 할 수 있다.
 */
struct EventView: View {
    let image: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
            Text(text)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
        }
        .padding()
    }
}
