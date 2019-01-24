import Cocoa

// 冒泡排序
func bubbleSort(_ arr: [Int]) -> [Int] {
  var arr = arr
  let count = arr.count
  for i in 0..<count {
    for j in (i + 1)..<count {
      if arr[i] > arr[j] {
        let temp = arr[i]
        arr[i] = arr[j]
        arr[j] = temp
      }
    }
  }
  return arr
}

print(bubbleSort([4, 5, 6, 3, 2, 1]))

// 插入排序
func insertionSort(_ arr: [Int]) -> [Int] {
  var arr = arr
  let count = arr.count
  for i in 0..<count {
    for j in (i + 1)..<count {
      for k in 0..<j {
        if arr[k] > arr[j] {
          let temp = arr[k]
          arr[k] = arr[j]
          arr[j] = temp
        }
      }
    }
  }
  return arr
}

print(insertionSort([4, 5, 6, 3, 2, 1]))

// 插入排序优于冒泡排序的点在于，他的交换操作只需要一次交换，而冒泡排序每次符合条件都需要做交换操作，这样会比较耗时
