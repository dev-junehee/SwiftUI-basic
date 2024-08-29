//
//  SimpleListView.swift
//  SwiftUI-basic
//
//  Created by junehee on 8/27/24.
//

import SwiftUI
/**
 UIKit TableView >>>  SwiftUI`List`
 */

/**
 `ForEach`을 왜 쓰는가?
 `Hashable`이 왜 필요한가?
 `Identifiable`이 왜 필요한가?
 `KeyPath`란?
 */
struct Genre: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let count: Int
}
struct SimpleListView: View {
    
    let genre = [
        Genre(name: "스릴러", count: 0),
        Genre(name: "SF", count: 1),
        Genre(name: "애니메이션", count: 2),
        Genre(name: "애니메이션", count: 3),
        Genre(name: "로맨스", count: 4),
    ]
    
    init() {
        print("SimpleListView Init")
    }
    
    var body: some View {
        /// `id`: 유니크한 값을 판별하는 기준 `(\.self, \.name, \.age... )`
        VStack {
            ForEach(genre, id: \.id) { item in
                Text("\(item.name) - \(item.count)")
            }
        }
        
        
    }
    
}

#Preview {
    SimpleListView()
}
