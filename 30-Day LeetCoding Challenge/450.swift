//
//  450.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/22.
//

import Foundation

/// 450. Delete Node in a BST
/**
 根据BST的性质:
 root.val  >  root.left.val
 root.val < root.right.val
 当找到对应的key所在的节点的时候，与它所在的右子树所在的最小的节点值进行替换，并且删除这个值。
 */
class Leetcode450 {

    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if (key > root.val) {
            root.right = deleteNode(root.right, key)
        } else if (key < root.val) {
            root.left = deleteNode(root.left, key)
        } else {
            if root.left != nil && root.right != nil {
                var minNode = root.right
                while minNode?.left != nil {
                    minNode = minNode?.left
                }
                root.val = minNode!.val
                root.right = deleteNode(root.right, minNode!.val)
            } else {
                let node = root.left != nil ? root.left : root.right
                return node
            }
        }
        return root
    }
    
    func test() {
        let cases = [
            [5,3,6,2,4,Int.min,7],
            [0],
            [5,3,6,2,4,Int.min,7]
        ]
        
        let keys = [3, 0, 0]
        for (index, ca) in cases.enumerated() {
            let root = TreeNode.buildTree(ca)
            let _ = deleteNode(root, keys[index])
            print("-------")
            root?.tranverse()
        }
    }
    
}
