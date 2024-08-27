//
//  SimpleCountView.swift
//  SwiftUI-basic
//
//  Created by junehee on 8/26/24.
//

import SwiftUI

/**
 `배경색이 왜 바뀔까? 언제 바뀔까?`
 - 매번 색깔이 바뀌기 때문에 뷰가 다시 그려진다는 추론이 가능하다.
 - 뷰가 다시 그려진다는 것은 body 연산 프로퍼티가 다시 실행되는 것
    - 액션과는 상관 없다. (액션 내부에 print를 찍어보면 잘 출력되고, 배경색이 변하지 않는다.)
    - State 값이 변경될 때 뷰가 다시 그려진다.
- Struct의 init과 body rendering은 다르다. 별도로 동작한다!
 
 `UIKit` => 데이터와 뷰가 따로 놀기 때문에 데이터가 변경되면 뷰를 업데이트 해주어야 한다.
 `SwiftUI` => 데이터가 바뀌면 뷰가 자동으로 다시 그려진다. => 데이터에 의존한다. => `Source of Truth`
 
 State가 변경되면 body 전체가 재렌더링 된다. 그럼 커스텀뷰로 분리한 뷰도 렌더링 될까?
 1) `property` - 재렌더링 된다.
 2) `method` - 재렌더링 된다.
 3) `struct` - 재렌더링되지 않는다. (하나의 뷰에서 사용하더라도 불필요한 렌더링을 줄이기 위해서는 struct로 분리해볼 수 있다.)
 */
struct SimpleCountView: View {
    
    /// `Source of Truth`  number가 변경되면 body가 다시 그려진다.
    /// Data에 대한 상태를 저장하고 관찰한다.
    /// SimpleCountView가 number를 소유하고 있다. => 외부와 단절시켜 주기 `private`
    @State private var number = 0
    
    init() {
        print("View Init")
    }
    
    var countProperty: some View {
        Text("Property : \(number)")
            .font(.largeTitle)
            .padding()
            .background(Color(red: .random(in: 0...1),
                              green: .random(in: 0...1),
                              blue: .random(in: 0...1))
            )
    }
    
    func methodProperty() -> some View {
        Text("Method : \(number)")
            .font(.largeTitle)
            .padding()
            .background(Color(red: .random(in: 0...1),
                              green: .random(in: 0...1),
                              blue: .random(in: 0...1))
            )
    }
    
    /**
     Number State가 바뀌면 뷰의 body가 항상 rendering 된다.
     그래서 Property, Method, Struct 로 만든 모든 커스텀 뷰도 다시 rendering 된다.
     
     body가 다시 그려지기 때문에 Struct 인스턴스도 당연히 새롭게 생성이 되지만 = init 구문은 동작하지만
     Struct의 body는 다시 그려지지 않는다. (애플에서도 구체적으로 밝혀주지 않음)
     */
    var body: some View {
        countProperty
        methodProperty()
        RenderingTest()
        
        Text("Body In : \(number)")
            .font(.largeTitle)
            .padding()
            .background(Color(red: .random(in: 0...1), 
                              green: .random(in: 0...1), 
                              blue: .random(in: 0...1))
            )
        HStack {
            Button("더하기") {
                number += 1
                // print("클릭")
            }
            Button("빼기") {
                number -= 1
            }
        }
        .padding()
        .font(.title)
    }
}

#Preview {
    SimpleCountView()
}

private struct RenderingTest: View {
    
    /// 아무리 body가 다시 안 그려지더라도 init 구문에 어떤 코드를 작성하는지에 따라 달라질 수 있기 때문에 유의해야 한다.
    init() {
        print("RenderingTestView Init")
    }
    
    var body: some View {
        Text("별도 Struct 커스텀뷰")
            .font(.largeTitle)
            .padding()
            .background(Color(red: .random(in: 0...1),
                              green: .random(in: 0...1),
                              blue: .random(in: 0...1))
            )
    }
    
}
