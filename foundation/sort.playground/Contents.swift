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

// 归并排序

func merge(_ arr: [Int]) -> [Int] {
  var arr = arr
  mergeSort(start: 0, end: arr.count - 1, arr: &arr)
  return arr
}

func mergeSort(start: Int, end: Int, arr: inout [Int]) {
  guard start < end else { return }
  
  let mid = (start + end) / 2
  mergeSort(start: start, end: mid, arr: &arr)
  mergeSort(start: mid + 1, end: end, arr: &arr)
  
  mergeArray(start: start, mid: mid, end: end, arr: &arr)
}

func mergeArray(start: Int, mid: Int, end: Int, arr: inout [Int]) {
  var tempArr = [Int]()
  
  var i = start
  var j = mid + 1
  while (i <= mid && j <= end) {
    if (arr[i] > arr[j]) {
      tempArr.append(arr[j])
      j += 1
    } else {
      tempArr.append(arr[i])
      i += 1
    }
  }
  
  while i <= mid {
    tempArr.append(arr[i])
    i += 1
  }
  
  while j <= end {
   tempArr.append(arr[j])
   j += 1
  }
  
  i = start
  for temp in tempArr {
    arr[i] = temp
    i += 1
  }
}

print(merge([4, 5, 6, 3, 2, 1]))
