//
//  104.swift
//  Leetcode
//
//  Created by 季勤强 on 2022/2/14.
//

import Foundation

/**
 104. Maximum Depth of Binary Tree
 https://leetcode.com/problems/maximum-depth-of-binary-tree/
 
 这题就是求一棵树的最长路径，比较简单。
 思路如下：
 一棵树的最长路径其实就是根节点的左子树跟右子树取较大的值 + 1，不断的递归，就能求出最长根节点的长度。
 */


class Leetcode104 {
    
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
    
}
