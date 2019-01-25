import Cocoa

extension String {
  subscript(_ index: Int) -> String {
    let start = self.index(startIndex, offsetBy: index)
    let end = self.index(start, offsetBy: 1)
    return String(self[start..<end])
  }
}

class ListNode<T> {
  var value: T
  var next: ListNode?
  
  init(_ value: T) {
    self.value = value
    self.next = nil
  }
}

func createLinkedList(_ data: String) -> ListNode<String>? {
  guard data.count > 0 else {
    return nil
  }
  let head = ListNode<String>(String(data[0]))
  
  var p = head
  for index in 1..<data.count {
    let q = ListNode<String>(String(data[index]))
    p.next = q
    p = q
  }
  
  return head
}

// 反转链表
func reverseNode(node: ListNode<String>) -> ListNode<String>? {
  var last: ListNode<String>?
  var next: ListNode<String>?
  var nodeH: ListNode<String>? = node
  
  while nodeH != nil {
    next = nodeH?.next
    nodeH?.next = last
    last = nodeH
    nodeH = next
  }
  return last
}

// Wrong Solution
func isPalindrome(node: ListNode<String>) -> Bool {
  var headNode: ListNode<String>? = node
  var reversedNode = reverseNode(node: node)
  print(headNode?.next)
  while headNode != nil {
    print("\(headNode?.value), \(reversedNode?.value)")
    if headNode?.value != reversedNode?.value {
      return false
    }
    
    reversedNode = reversedNode?.next
    headNode = headNode?.next
  }
  
  return true
}

//let node = createLinkedList("dlyld")
//print(isPalindrome(node: node!))

// 栈
struct Stack<T> {
  
  var items: [T] = []

  mutating func push(_ value: T) {
    self.items.append(value)
  }
  
  mutating func pop() -> T? {
    guard !isEmpty() else { return nil }
    return self.items.removeLast()
  }
  
  func isEmpty() -> Bool {
    return self.items.count == 0
  }
  
}

func reverseNode() {
  var stack = Stack<String>()
  var head = createLinkedList("123456")
  var p = head
  while p != nil {
    stack.push(p!.value)
    p = p!.next
  }
  
  while !stack.isEmpty() {
    print(stack.pop())
  }
}

reverseNode()
