//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/17.
//

import Foundation

struct CalculatorItemQueue {
    private let queue: LinkedList = LinkedList()
    
    func enqueue(data: String) {
        queue.append(data: data)
    }
    
    func dequeue() -> String? {
        return queue.remove()
    }
    
    func count() -> Int {
        return queue.count()
    }
}

struct Formula {
    // 피연산자(연산자의 연산의 대상)
    var operands: CalculatorItemQueue
    // 연산자
    var operators: CalculatorItemQueue
    
    func result() -> Double {
        
        // 나중에 Error 관련해서 생성한 이후, {} 안에 return이 아닌 Error throw로 변경
        guard let firstHead = operands.dequeue() else { return 0.0 }
        guard var middleResult = Double(firstHead) else { return 0.0 }
        
        (0...operands.count()).forEach { _ in
            guard let nextNode = operands.dequeue() else { return }
            guard let rhs = Double(nextNode) else { return }
            
            guard let stringOperator = operators.dequeue() else { return }
            guard let eachOperator = Operator(rawValue: stringOperator[stringOperator.startIndex]) else { return }
            
            middleResult = eachOperator.calculate(lhs: middleResult, rhs: rhs)
        }
        print("결과는? \(middleResult)")
        
        return middleResult
    }
}

enum ExpresstionParser {
    static func parse(from input: String) -> Formula? {
        // 빈 배열일때,
        guard !input.isEmpty else { return nil }
        
        let userInput = componentsByOperators(from: input)
        
        let numberQueue = CalculatorItemQueue()
        let operatorQueue = CalculatorItemQueue()
        
        (0...userInput.count-1).forEach { index in
            index % 2 == 0 ? numberQueue.enqueue(data: userInput[index]) : operatorQueue.enqueue(data: userInput[index])
        }
        let result = Formula(operands: numberQueue, operators: operatorQueue)
        result.result()
        
        return result
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]

        Operator.allCases.forEach { myOperator in
            result = result.flatMap {
                $0.split(with: myOperator.rawValue)
            }
        }
        return result
    }
}
