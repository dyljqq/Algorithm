//
//  863.swift
//  Leetcode
//
//  Created by polaris dev on 2023/7/11.
//

import Foundation

class Solution863 {
    
    var parents: [Int: TreeNode] = [:]
    var ans: [Int] = []
    
    func findParents(_ root: TreeNode?) {
        guard let root else { return }
        if let left = root.left {
            parents[left.val] = root
            findParents(root.left)
        }
        if let right = root.right {
            parents[right.val] = root
            findParents(root.right)
        }
    }
    
    func findAns(_ node: TreeNode?, from: TreeNode?, depth: Int, k: Int) {
        guard let node else { return }
        if depth == k {
            ans.append(node.val)
        }
        
        if node.left?.val != from?.val {
            findAns(node.left, from: node, depth: depth + 1, k: k)
        }
        if node.right?.val != from?.val {
            findAns(node.right, from: node, depth: depth + 1, k: k)
        }
        if parents[node.val]?.val != from?.val {
            findAns(parents[node.val], from: node, depth: depth + 1, k: k)
        }
    }

    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        guard let root, let target else { return [] }
        findParents(root)
        findAns(target, from: nil, depth: 0, k: k)
        return ans
    }
    
    func test() {
        let root = TreeNode(3)
        root.left = TreeNode(5)
        root.right = TreeNode(1)
        root.left?.left = TreeNode(6)
        root.left?.right = TreeNode(2)
        root.right?.left = TreeNode(0)
        root.right?.right = TreeNode(8)
        root.left?.right?.left = TreeNode(7)
        root.left?.right?.right = TreeNode(4)
        
        print(distanceK(root, root.left, 2))
    }
}
