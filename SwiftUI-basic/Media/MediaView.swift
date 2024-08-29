//
//  MediaView.swift
//  SwiftUI-basic
//
//  Created by junehee on 8/29/24.
//

import SwiftUI

struct MediaView: View {
    
    let headline = [
        "인기 영화 TOP 10",
        "이달의 추천 영화",
        "다음 달 개봉 영화",
        "다시 보기는 어떠신가요?"
    ]
    
    init() {
        print("MediaView Init")
    }
    
    var body: some View {
        ScrollView(.vertical) {
            ForEach(headline, id: \.self) { item in
                makeSection(title: item)
            }
            // Text(
            // HorizontalSectionView()
            // Text("다시보기는 어떠신가요?")
            // HorizontalSectionView()
            // Text("다음 달 개봉 영화")
            // HorizontalSectionView()
        }
    }
    
    func makeSection(title: String) -> some View {
        VStack {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            HorizontalSectionView()
                .padding(.bottom, 20)
        }
    }
}



#Preview {
    MediaView()
}
