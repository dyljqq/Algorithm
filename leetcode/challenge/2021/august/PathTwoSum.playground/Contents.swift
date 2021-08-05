import Cocoa

func helper(_ root: TreeNode?, _ targetSum: Int, _ out: inout [Int], _ res: inout [[Int]]) {
    guard let root = root else {
        return
    }
    
    out.append(root.val)

    let remain = targetSum - root.val
    if remain == 0 && root.left == nil && root.right == nil {
        res.append(out)
    }

    helper(root.left, remain, &out, &res)
    helper(root.right, remain, &out, &res)
    let _ = out.popLast()
    
    return
}

func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
    var out = [Int]()
    var res = [[Int]]()
    helper(root, targetSum, &out, &res)
    return res
}

let root = TreeNode.build([5,4,8,11,nil,13,4,7,2,nil,nil,5,1])
print(pathSum(root, 22))
