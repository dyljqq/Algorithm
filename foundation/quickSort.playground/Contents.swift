import Cocoa

func quickSort(_ arr: [Int]) -> [Int] {
  var arr = arr
  _quickSort(&arr, 0, arr.count - 1)
  return arr
}

func _quickSort(_ arr: inout [Int], _ p: Int, _ r: Int) {
  guard p < r else { return }
  let m = partion(&arr, p, r)
  _quickSort(&arr, p, m - 1)
  _quickSort(&arr, m + 1, r)
}

func partion(_ arr: inout [Int], _ p: Int, _ r: Int) -> Int {
  var i = p
  for j in p..<r {
    if arr[j] < arr[r] {
      arr.swapAt(i, j)
      i += 1
    }
  }
  arr.swapAt(i, r)
  return i
}

print(quickSort([8, 10, 2, 3, 6, 1, 5]))
