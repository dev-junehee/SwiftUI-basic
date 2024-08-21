//
//  ContentView.swift
//  SwiftUI-basic
//
//  Created by junehee on 8/21/24.
//

import SwiftUI

/**
 UIKit으로 View를 만들 때
 1) 인스턴스 생성
 2) addSubView
 3) 오토레이아웃
 4) Property - 폰트, 색상...
 
 SwiftUI에서는
 `addSubView, 오토레이아웃` 생략!!!!!!!
 */

/**
 `some`
 - Swift 5.1+
 - Opaque Type / 불투명 타입 / 역제네릭 타입
 
 `any`
 - Swift 5.6+
 - Boxed Protocol Type
 */

/**
 `제네릭 타입`
 T에 어떤 타입이 들어올지는 모른다.  User가 직접 사용되는 시점에 어떤 타입인지 알 수 있다.
 즉 호출 시점에 타입이 결정되고, 호출 전에는 타입을 알지 못한다.
 
 `역제네릭 타입`
 호출 전에 타입을 알지만, 호출 시에는 타입을 숨긴다.
*/
struct UserTest1<T> {
    let name: String
    let content: T
}

/**
 구조체에서는 프로퍼티가 변수라도 변경할 수 없다.
 변경을 원할 경우 `mutating` 키워드를 사용해야 한다.
 
 만약 연산 프로퍼티 안에서 변수를 변경하고 싶다면?
 (연산 프로퍼티는 get, set을 작성해야 하지만, set이 없을 경우 get은 생략 가능)
 구조체 연산 프로퍼티 get의 기본 특성은 nonmutating (불변)
 >>> get 앞에 `mutating` 키워드를 사용하여 해결할 수 있다.
 >>>  만약`get` 키워드가 생략되었다면? 변수 변경 불가능!
 */
struct UserTest2 {
    /// 저장 프로퍼티
    var nickname = "고래밥"

    /// 연산 프로퍼티 (만약 연산 프로퍼티 안에서 변수를 변경하고 싶다면? 현재 코드는 Error)
    // var introduce: String {
    //     nickname = "칙촉"
    //     return "안녕하세요. \(nickname)입니다."
    // }
    
    var introduce: String {
        mutating get {
            nickname = "칙촉"
            return "안녕하세요. \(nickname)입니다."
        }
    }
    
    // func changeName() {
    //     nickname = "칙촉"     /// Error
    // }
    
    mutating func changeName() {
        nickname = "칙촉"
    }
}

struct ContentView: View {
    
    let user1 = UserTest1(name: "사용자1", content: false)
    let user2 = UserTest1(name: "사용자2", content: 5.5)
    
    // @State private var inputText = ""
    
    /**
     body 프로퍼티에서 변수를 수정하지 못하는 이유는?
     @State를 붙였을 때는 문제가 없지만, 없을 때 오류가 나는 이유는?
     immutable 하다던데 그 이유는?
     >>> 구조체 + body 연산 프로퍼티의 특성
     >>> `Property Wrapper`
     */
    @State var number = 0
    
    /**
     `body` 연산 프로퍼티
     body 프로퍼티는 어떤 타입으로 반환되는 연산 프로퍼티인지 안다.
     복잡하더라도 타입을 일일이 명세해주는 것도 가능하다. (e.g. Button<Text>, TupleView<(Text, Button<Text>)>)
     호출 전에 이미 타입이 무엇인지 알 수 있음.
     타입을 알더라도 블러 처리해서 숨기자!
     
     `view` 프로토콜 내에서 `body`는 `mutating get`이 아니라 `get`으로 강제되어 있다.
     그러므로 `mutating get`으로 변경할 경우 `body`가 없다고 간주되어 오류가 발생한다.
     >>> 애플의 대책 : 변경을 하고싶다면 `@State`를 사용해라.
     */
    var body: some View {
        Button("확인") {
            print("버튼 클릭")
            print(type(of: self.body))
            number += 1
        }
        
        // Text("기본은 수직입니다")
        // Text("기본은 수직입니다")
        // 
        // HStack {
        //     Text("HStack은 수평입니다")
        //     Text("HStack은 수평입니다")
        // }
        // 
        // TextField("텍스트필드", text: $inputText)
        
    }
    
}

#Preview {
    ContentView()
}
