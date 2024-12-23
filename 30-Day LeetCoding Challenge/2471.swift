//
//  2471.swift
//  Leetcode
//
//  Created by polaris dev on 2024/12/23.
//

import Foundation

class Solution2471 {
    
    func handle(with arr: [Int]) -> Int {
        var ans = 0, arr = arr
        let st = arr.sorted()
        var m: [Int: Int] = [:]
        st.enumerated().forEach { (key, value) in m[value] = key }
        
        for index in 0..<arr.count {
            arr[index] = m[arr[index], default: 0]
        }
        
        for index in 0..<arr.count {
            while arr[index] != index {
                arr.swapAt(index, arr[index])
                ans += 1
            }
        }
        return ans
    }
    
    func minimumOperations(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var queue: [TreeNode] = [root]
        var ans = 0
        while !queue.isEmpty {
            var values: [Int] = []
            var temp = [TreeNode]()
            for node in queue {
                if let left = node.left {
                    temp.append(left)
                    values.append(left.val)
                }
                
                if let right = node.right {
                    temp.append(right)
                    values.append(right.val)
                }
            }
            
            ans += handle(with: values)
            queue = temp
        }
        return ans
    }
    
    func test() {
        var treeNode = TreeNode(1)
        treeNode.left = TreeNode(4)
        treeNode.right = TreeNode(3)
        treeNode.left?.left = TreeNode(7)
        treeNode.left?.right = TreeNode(6)
        treeNode.right?.left = TreeNode(8)
        treeNode.right?.right = TreeNode(5)
        treeNode.right?.left?.left = TreeNode(9)
        treeNode.right?.right?.left = TreeNode(10)
        
//        treeNode.left = TreeNode(2)
//        treeNode.right = TreeNode(3)
//        treeNode.left?.left = TreeNode(4)
//        treeNode.left?.right = TreeNode(5)
//        treeNode.right?.left = TreeNode(6)
        
        print(minimumOperations(treeNode))
    }
    
}
