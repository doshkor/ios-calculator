//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/17.
//

import Foundation

struct CalculatorItemQueue {
    private let queue: LinkedList = LinkedList()
    
    func enqueue(data: Value) {
        queue.append(data: data)
    }
    
    func dequeue() {
        queue.remove()
    }
}

struct Formula {
    // 피연산자(연산자의 연산의 대상)
    var operands: CalculatorItemQueue {
        didSet {
            self.operands.enqueue(data: <#T##Value#>)
        }
    }
    // 연산자
    var operators: CalculatorItemQueue
    
    func result() -> Double {
            
        // operators를 사용해 operands 계산하기
        
        return 0.0
    }
}

enum ExpresstionParser {
    func parse(from input: String) -> Formula? {
//        componentsByOperators(from: )로 나눈 [String]을 Formula 타입으로 넣어주기.
        let result = componentsByOperators(from: input)
//        Formula(operands: <#T##CalculatorItemQueue#>, operators: <#T##CalculatorItemQueue#>)
//        return Formula(operands: result[1], operators: result[0])
        return nil
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        // 1. input에서 연산자 포함하고 있는지 확인하기
        // 2. 연산자 갖고 있으면 그 연산자를 extension String에 구현한 split함수에 전달해주기
        // 3. 2번에서 return으로 [String] 받아서 return 주기
        var result = [String]()
        
        Operator.allCases.forEach { eachOperator in
            if input.contains(eachOperator.rawValue){
                result = input.split(with: eachOperator.rawValue)
            }
        }
        return result
    }
}
