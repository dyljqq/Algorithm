import Cocoa


// 后进先出
struct Stack {
  
  var items: [Int] = []
  
  var isEmpty: Bool {
    return items.count == 0
  }
  
  var top: Int? {
    return items.last
  }
  
  mutating func push(_ item: Int) {
    items.append(item)
  }
  
  mutating func pop() -> Int? {
    guard !isEmpty else { return nil }
    return items.popLast()
  }
  
}

// 先进先出
struct Queue {
  
  var preStack: Stack = Stack()
  var lastStack: Stack = Stack()
  
  var isEmpty: Bool {
    return preStack.isEmpty && lastStack.isEmpty
  }
  
  mutating func push(_ item: Int) {
    preStack.push(item)
  }
  
  mutating func pop() -> Int? {
    if lastStack.isEmpty {
      while true {
        guard let item = preStack.pop() else {
          break
        }
        lastStack.push(item)
      }
    }
    return lastStack.pop()
  }
  
}

var queue = Queue()
let arr = [1, 2, 3, 4, 5]
arr.forEach { queue.push($0) }

while true {
  guard let item = queue.pop() else { break }
  print(item)
}
