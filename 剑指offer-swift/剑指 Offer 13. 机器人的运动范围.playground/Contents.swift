import Cocoa

class Solution {
    
    func sumPosition(_ i: Int, _ j: Int) -> Int {
        let sumCallback: (Int) -> Int = { num in
            var num = num, sum = 0
            while num > 0 {
                sum = sum + num % 10
                num = num / 10
            }
            return sum
        }
        return sumCallback(i) + sumCallback(j)
    }
    
    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        var queue = [(0, 0)]
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        var matrix = Array(repeating: Array(repeating: false, count: n), count: m)
        
        var res = 1
        matrix[0][0] = true
        while !queue.isEmpty {
            let (row, column) = queue.popLast()!
            for direction in directions {
                guard (direction.0 + row) >= 0
                        && (direction.0 + row) < m
                        && (direction.1 + column) >= 0
                        && (direction.1 + column) < n
                        && !matrix[direction.0 + row][direction.1 + column] else {
                    continue
                }
                matrix[direction.0 + row][direction.1 + column] = true
                let value = sumPosition(direction.0 + row, direction.1 + column)
                if value <= k {
                    res += 1
                    queue.append((direction.0 + row, direction.1 + column))
                }
            }
        }
        
        return res
    }
}

let solution = Solution()
print(solution.movingCount(2, 3, 1))
print(solution.movingCount(3, 1, 0))
