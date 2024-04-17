//
//  988.swift
//  Leetcode
//
//  Created by polaris dev on 2024/4/17.
//

import Foundation

// 需要注意的点：字典序排序是会比较首字母的大小，以此类推，而不会管你字符长短
class Solution988 {
    
    var minStr = ""
    
    func numberToCharacter(_ number: Int) -> Character {
        let asciiValue = UInt8(97 + number)
        return Character(UnicodeScalar(asciiValue))
    }
    
    func dfs(_ root: TreeNode?, path: [Character]) {
        guard let root = root else { return }
        let val = numberToCharacter(root.val)
        var path = path
        path.append(val)
        if root.left == nil && root.right == nil {
            let p = String(path.reversed())
            if minStr.isEmpty || p < minStr {
                minStr = p
            }
        }
        
        dfs(root.left, path: path)
        dfs(root.right, path: path)
    }
    
    func smallestFromLeaf(_ root: TreeNode?) -> String {
        dfs(root, path: [])
        return minStr
    }
    
    func test() {
        //[3,9,20,null,null,15,7]
        
        for i in [3, 9, 20, 15, 7] {
            print(numberToCharacter(i))
        }
        
        var root = TreeNode(3)
        root.left = TreeNode(9)
        root.right = TreeNode(20)
        root.right?.left = TreeNode(15)
        root.right?.right = TreeNode(7)
        print(smallestFromLeaf(root))
    }
}
