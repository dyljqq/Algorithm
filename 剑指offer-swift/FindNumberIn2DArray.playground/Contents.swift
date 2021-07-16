import Cocoa

class Solution {
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty && !matrix[0].isEmpty else {
            return false
        }
        
        var row = 0, column = matrix[0].count - 1
        while row < matrix.count && column >= 0 {
            let value = matrix[row][column]
            if value > target {
                column -= 1
            } else if value < target {
                row += 1
            } else {
                return true
            }
        }
        return false
        
    }
}

let solution = Solution()

let matrix = [
    [1,   4,  7, 11, 15],
    [2,   5,  8, 12, 19],
    [3,   6,  9, 16, 22],
    [10, 13, 14, 17, 24],
    [18, 21, 23, 26, 30]
  ]
print(solution.findNumberIn2DArray(matrix, 5))
print(solution.findNumberIn2DArray(matrix, 20))
