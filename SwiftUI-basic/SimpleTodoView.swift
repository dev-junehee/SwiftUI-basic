//
//  SimpleTodoView.swift
//  SwiftUI-basic
//
//  Created by junehee on 8/28/24.
//

import SwiftUI

/**
 `ForEach`
 1. Hashable
 2. KeyPath
 3. Init 2번 실행
 4. Reusable
 
 `VStack` iOS13+ (전체를 한 번에 로드, 컨텐츠 크기 스크롤)
 `LazyVSTack` 14+ (일부만 로드, 전체스크롤)
 */

struct Todo: Hashable {
    let name: String
    let priority: Int
}

struct SimpleTodoView: View {
    
    @State private var data = [
        Todo(name: "영화보기", priority: 1),
        Todo(name: "과제하기", priority: 2),
        Todo(name: "과제하기", priority: 2),
        Todo(name: "밥 먹기", priority: 3),
    ]
    
    @State private var text = ""
    
    var body: some View {
        
        HStack {
            TextField("할 일을 입력해 주세요~", text: $text)
                .padding()
            Button("추가") {
                let todo = Todo(name: text, priority: .random(in: 1...3))
                data.append(todo)
            }
            .padding(5)
            .background(.blue)
            .foregroundStyle(.white)
            .padding()
        }
        
        List {
            /// ForEach에서는 id에 들어가는 데이터가 고유해야 한다.
            /// String, Int 타입은 내부적으로 Hashable 프로토콜을 채택하고 있다.
            /// 하지만 Todo 모델은 아무것도 채택하지 않고 있기 때문에 self로 id를 설정할 경우 Hashable 프로토콜이 필요하다.
            ForEach(data, id: \.self) { item in
                TodoView(item: item.priority)
            }
        }
        
        // List {
        //     ForEach(1..<100) { item in
        //         TodoView(item: item)
        //     }
        // }
        
        // ScrollView {
        //     LazyVStack {
        //         ForEach(1..<100) { item in
        //             TodoView(item: item)
        //         }
        //     }
        // }
    }
}

struct TodoView: View {
    
    let item: Int
    
    init(item: Int) {
        self.item = item
        print("TodoView Init \(item)")
    }
    
    var body: some View {
        HStack {
            Text("\(item)")
                .font(.title)
                .asForeground(.red)
            Spacer()
            
            // Button(action: {
            //     print("acacaca")
            // }, label: {
            //     HStack {
            //         Text("테스트")
            //         Image(systemName: "star")
            //     }
            // })
            
            HStack {
                Text("zzz")
                Image(systemName: "star")
            }
            .wrapToButton {
                print("클릭햇슈!")
            }
        }
    }
    
}

#Preview {
    SimpleTodoView()
}
