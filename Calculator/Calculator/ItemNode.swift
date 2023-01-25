//
//  ItemNode.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/17.
//

import Foundation

final class ItemNode {
    let data: String
    var next: ItemNode?
    
    init(data: String, next: ItemNode? = nil) {
        self.data = data
        self.next = next
    }
}

struct Value {
    let operators: Operator?
    let number: Double
}
