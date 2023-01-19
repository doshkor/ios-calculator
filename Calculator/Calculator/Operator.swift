//
//  Operator.swift
//  Calculator
//
//  Created by 신동오 on 2023/01/17.
//

import Foundation

protocol CalculateItem {
}

enum Operator: Character, CalculateItem, CaseIterable {
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .substract:
            return substract(lhs: lhs, rhs: rhs)
        case .divide:
            return divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        print("add 함수 실행")
        return lhs + rhs
    }
    private func substract(lhs: Double, rhs: Double) -> Double {
        print("divide 함수 실행")
        return lhs - rhs
    }
    private func divide(lhs: Double, rhs: Double) -> Double {
        print("add 함수 실행")
        return lhs / rhs
    }
    private func multiply(lhs: Double, rhs: Double) -> Double {
        print("divide 함수 실행")
        return lhs * rhs
    }
}
