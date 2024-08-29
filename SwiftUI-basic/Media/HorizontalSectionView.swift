//
//  HorizontalSectionView.swift
//  SwiftUI-basic
//
//  Created by junehee on 8/29/24.
//

import SwiftUI

/**
 1) HStack 안에 뷰가 많다고 해서 스크롤되는 것은 아니기 때문에 스크롤 뷰로 감싸서 사용
 2) HStack과 LazyHStack의 동작이 다르다. (초기 로드)
 3) 반복되는 뷰가 많아질수록 ForEach의 장점이 있다.
 4) AsyncImage에서 ProgressView에도 frame을 설정하는 이유 - 초기 로드 시 화면 바깥에 있는 것들까지 로드되기 때문에 맞춰주기 위해서
 */
struct HorizontalSectionView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack { /// 60개, 70개...라면? 전체 로드할 필요X => Lazy
                ForEach(0..<6) { _ in
                    PosterView()
                }
            }
        }
        
    }
}

#Preview {
    HorizontalSectionView()
}
