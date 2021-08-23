//
//  TwoSumIV-InputIsABSt.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/8/23.
//

import Foundation

public class TreeNode {
    
    var val: Int
    var left: TreeNode? = nil
    var right: TreeNode? = nil
    
    init(_ val: Int) {
        self.val = val
    }
    
    static func buildTree(_ vals: [Int]) -> TreeNode? {
        guard !vals.isEmpty else {
            return nil
        }
        var count = 1
        let root = TreeNode(vals[0])
        var nodes = [root]
        while count < vals.count {
            var arr = [TreeNode]()
            for node in nodes {
                if count < vals.count && vals[count] != Int.min {
                    node.left = TreeNode(vals[count])
                    arr.append(node.left!)
                }
                
                count = count + 1
                if count < vals.count && vals[count] != Int.min {
                    node.right = TreeNode(vals[count])
                    arr.append(node.right!)
                }
                count += 1
            }
            nodes = arr
        }
        return root
    }
    
    func tranverse() {
        print(self.val)
        self.left?.tranverse()
        self.right?.tranverse()
    }
    
}


class TwoSumIVInputIsABST {
        
    func helper(_ root: TreeNode?, _ hash: inout [Int: Int]) {
        guard let root = root else {
            return
        }
        
        hash[root.val, default: 0] += 1
        helper(root.left, &hash)
        helper(root.right, &hash)
    }
    
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var hash: [Int: Int] = [:]
        helper(root, &hash)
        
        for key in hash.keys {
            if let val = hash[k - key] {
                if (key == (k - key) && val >= 2) || key != (k - key) {
                    return true
                }
            }
        }
        return false
    }
    
    func test() {
        var root = TreeNode.buildTree([5,3,6,2,4,Int.min,7])
        print(findTarget(root, 9))
        print(findTarget(root, 28))

        root = TreeNode.buildTree([2,1,3])
        print(findTarget(root, 4))
        print(findTarget(root, 1))
        print(findTarget(root, 3))

        root = TreeNode.buildTree([1])
        print(findTarget(root, 2))

        root = TreeNode.buildTree([0,-2,3,Int.min,-1,Int.min,4])
        print(findTarget(root, -2))
        
        root = TreeNode.buildTree([2,1,3,-4,Int.min,Int.min,Int.min,Int.min,0])
        print(findTarget(root, 2))
    }
    
}
