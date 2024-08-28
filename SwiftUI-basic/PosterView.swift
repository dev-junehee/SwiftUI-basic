//
//  PosterView.swift
//  SwiftUI-basic
//
//  Created by junehee on 8/28/24.
//

import SwiftUI

struct PosterView: View {
    let imageURL = URL(string: "https://picsum.photos/200/300")
    
    var body: some View {
        AsyncImage(url: imageURL) { data in
            switch data {
            case .empty:
                /// 성공/실패도 아닌 로드하고 있는 상황
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .clipShape(.circle)
            case .failure(let error):
                Image(systemName: "heart.fill")
            @unknown default:
                Image(systemName: "xmark")
            }
        }
            
        
        Image(systemName: "heart.fill")
            .resizable()
            .frame(width: 50, height: 50)
            .wrapToButton {
                print("하트를 클릭")
            }
            .background(.pink)
        
        
        
    }
}

#Preview {
    PosterView()
}
