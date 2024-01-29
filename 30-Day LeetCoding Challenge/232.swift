//
//  232.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/29.
//

import Foundation

class MyQueue {
    
    class Stack {
        
        private var array: [Int] = []
        
        init() {
            
        }
        
        func push(_ x: Int) {
            array.append(x)
        }
        
        func pop() -> Int? {
            guard !array.isEmpty else { return nil }
            return array.removeLast()
        }
        
        var isEmpty: Bool {
            return array.isEmpty
        }
        
        func top() -> Int? {
            return array.last
        }
    }
    
    private var leftStack = Stack()
    private var rightStack = Stack()

    init() {
        
    }
    
    func push(_ x: Int) {
        leftStack.push(x)
    }
    
    func pop() -> Int {
        poll()
        return rightStack.pop() ?? -1
    }
    
    func peek() -> Int {
        poll()
        return rightStack.top() ?? -1
    }
    
    func empty() -> Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    private func poll() {
        if rightStack.isEmpty {
            while let value = leftStack.pop() {
                rightStack.push(value)
            }
        }
    }
}
