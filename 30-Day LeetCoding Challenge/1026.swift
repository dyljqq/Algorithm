//
//  1026.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/11.
//

import Foundation

class Solution1026 {
    
    func helper(_ root: TreeNode?, maxValue: Int, minValue: Int, result: inout Int) {
        guard let root else { return }
        let val = root.val
        let temp = max(abs(maxValue - root.val), abs(minValue - root.val))
        result = max(temp, result)
        let maxValue = max(maxValue, val)
        let minValue = min(minValue, val)
        helper(root.left, maxValue: maxValue, minValue: minValue, result: &result)
        helper(root.right, maxValue: maxValue, minValue: minValue, result: &result)
    }
    
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var result = 0
        helper(root, maxValue: root.val, minValue: root.val, result: &result)
        return result
    }
}
