//
//  144.swift
//  Leetcode
//
//  Created by polaris dev on 2023/1/9.
//

import Foundation

class Leetcode144 {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var arr = [root.val]
        arr.append(contentsOf: preorderTraversal(root.left))
        arr.append(contentsOf: preorderTraversal(root.right))
        return arr
    }
}
