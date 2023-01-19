//
//  Extension.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/18.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        // String(즉, Self)를 target을 사용해 나눠 [String] 형태로 return
        // split 안쓴 이유는 return이 Array<String.elements>로 나와서.
        let result = self.components(separatedBy: target.description)
        return result
    }
}
