//
//  116.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/12/29.
//

import Foundation

class Node {
    let val: Int
    var left: Node?
    var right: Node?
    var next: Node?
    
    init(_ val: Int) {
        self.val = val
    }
}

class Leetcode116 {
    func connect(_ root: Node?) -> Node? {
        var queue = [root]
        while !queue.isEmpty {
            var q = [Node]()
            for (i, node) in queue.enumerated() {
                if (i + 1) < queue.count {
                    queue[i]?.next = queue[i + 1]
                }
                if let left = node?.left {
                    q.append(left)
                }
                if let right = node?.right {
                    q.append(right)
                }
            }
            queue = q
        }
        return root
    }
}
