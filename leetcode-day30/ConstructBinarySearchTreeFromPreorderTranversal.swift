//
//  ConstructBinarySearchTreeFromPreorderTranversal.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/13.
//

import Foundation

class ConstructBinarySearchTreeFromPreorderTranversal {
    
    func helper(_ preorder: [Int], _ p: Int, _ q: Int) -> TreeNode? {
        guard p < q else {
          return nil
        }
        let root = TreeNode(preorder[p])
        var m = p
        while m < q && preorder[m] <= root.val {
          m += 1
        }
        root.left = helper(preorder, p + 1, m)
        root.right = helper(preorder, m, q)
        return root
      }
      
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        return helper(preorder, 0, preorder.count)
    }
    
    func test() {
        let arr = [8,5,1,7,10,12]
        let root = bstFromPreorder(arr)
        root?.tranverse()
    }
    
}
