//
//  SearchView.swift
//  SwiftUI-basic
//
//  Created by junehee on 8/29/24.
//

/**
 UIKit - `NavigationController`
 SwiftUI - `NavigationView` vs `NavigationStack` (iOS 16+)
 
 NavigationView - `NavigationLink`(destination)
 - NavigationLink를 사용할 때 단점 : 하위 뷰가 한 번에 로드된다. (init 구문으로 확인 가능. init 시점에 네트워크 콜이 일어난다면?)
 
 NavitationStack - `NavigationLink` (value)
 
 `NavigationTitle`
 - 다른 뷰의 Modifier로 설정되는 이유
 - (스토리보드) NavigationController를 임베드하면 하위 뷰에서 실제 네비게이션 타이틀을 설정해주는 원리를 생각해보기.
 
 ForEach
 - 데이터는 변경되지 않는 상수가 좋다.
 */
import SwiftUI

struct SearchView: View {
    
    @State private var text = ""
    
    let list = ["Hue", "Jack", "Bran", "Den"]
    var filteredUser: [String] {
        return text.isEmpty ? list : list.filter({ $0.contains(text) })
    }
    
    var body: some View {
        NavigationView {
            /// 네비게이션 하위 뷰 중 최상위 - NavigationTitle 설정 위치
            List {
                ForEach(filteredUser, id: \.self) { item in
                    NavigationLink {
                        SearchDetailView(data: item)
                    } label: {
                        Text("\(item)")
                    }
                }
            }
            .navigationTitle("유저 검색")
            .searchable(text: $text, placement: .automatic, prompt: "유저를 검색해 보세용~")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        print("pencil click")
                    }, label: {
                        Image(systemName: "pencil")
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "heart")
                }
            }
        }
    }
    
    
    
    /// 화면전환 연습 바디
    // var body: some View {
    //     NavigationView {
    //         VStack {
    //             // Text("HELLO WORLD")
    //             
    //             NavigationLink("화면전환") {
    //                 MediaView()
    //             }
    //             
    //             NavigationLink("Simple") {
    //                 SimpleListView()
    //             }
    //             
    //             NavigationLink {
    //                 CategoryView()
    //             } label: {
    //                 // Text("카테고리로 전환")
    //                 //     .font(.title)
    //                 //     .background(.quinary)
    //                 
    //                 /// 커스텀 뷰를 클릭했을 때 화면 전환도 가능
    //                 // PosterView()
    //                 
    //                 VStack {
    //                     Image(systemName: "star.fill")
    //                         .padding()
    //                         .background(.brown)
    //                 }
    //             }
    // 
    //         }
    //         .navigationTitle("네비게이션 타이틀")
    //     }
    // }
}

struct SearchDetailView: View {
    
    var data: String
    
    init(data: String) {
        self.data = data
        print("SearchDetailView \(data)")
    }
    
    var body: some View {
        Text("SearchDetailView \(data)")
        Button("바뀐다 얍!") {
            print("dddd")
        }
    }
}

#Preview {
    SearchView()
}
