//
//  CalculatorItemNode.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/17.
//

import Foundation

final class ItemNode {
    var data: Value
    var next: ItemNode?
    
    init(data: Value, next: ItemNode? = nil) {
        self.data = data
        self.next = next
    }
}

struct Value {
    var operators: Operator?
    var number: Double
}