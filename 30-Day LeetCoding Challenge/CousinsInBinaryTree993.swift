//
//  CousinsInBinaryTree993.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/18.
//

import Foundation

class CousinsInBinaryTree993 {
    
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {

        var xr: (TreeNode?, Int) = (nil, 0)
        var yr: (TreeNode?, Int) = (nil, 0)

        func getDepth(_ root: TreeNode?, _ parent: TreeNode?, _ depth: Int) {
            guard let root = root else {
                return
            }
            if root.val == x {
                xr = (parent, x)
            }

            if root.val == y {
                yr = (parent, y)
            }

            getDepth(root.left, root, depth + 1)
            getDepth(root.right, root, depth + 1)
        }

        getDepth(root, nil, 0)
        return xr.0 !== yr.0 && xr.1 == yr.1
    }
    
    func test() {
        let root = TreeNode.build([1,nil,2,3,nil,nil,4,nil,5])
        print(isCousins(root, 1, 3))
    }
    
}
