import Cocoa

// 面试题6： 重建二叉树

class Node {
  var val: Int
  var left: Node?
  var right: Node?
  
  init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
  }
}

// 已知前序遍历和中序遍历，构建二叉树
func createTree(preArr: [Int], midArr: [Int]) {
  guard preArr.count > 0 && midArr.count > 0 else {
    return
  }
  let root = construct(startPre: 0, endPre: preArr.count - 1, startIn: 0, endIn: midArr.count - 1, preArr: preArr, midArr: midArr)
  print(root?.val)
  reverse(root)
}

func construct(startPre: Int, endPre: Int, startIn: Int, endIn: Int, preArr: [Int], midArr: [Int]) -> Node? {
  let val = preArr[startPre]
  let root = Node(val)
  
  var rootIn = startIn
  while rootIn <= endIn && midArr[rootIn] != val {
    rootIn += 1
  }
  
  let leftLen = rootIn - startIn
  let leftPreEnd = startPre + leftLen
  
  if leftLen > 0 { // 如果左子树存在
    root.left = construct(startPre: startPre + 1, endPre: leftPreEnd, startIn: startIn, endIn: rootIn - 1, preArr: preArr, midArr: midArr)
  }
  
  if leftLen < (endPre - startPre) { // 如果右字树存在
    root.right = construct(startPre: leftPreEnd + 1, endPre: endPre, startIn: rootIn + 1, endIn: endIn, preArr: preArr, midArr: midArr)
  }
  
  return root
}

func reverse(_ root: Node?) {
  guard let root = root else {
    return
  }
  print("\(root.val)")
  reverse(root.left)
  reverse(root.right)
}

createTree(preArr: [1, 2, 4, 7, 3, 5, 6, 8], midArr: [4, 7, 2, 1, 5, 3, 8, 6])
