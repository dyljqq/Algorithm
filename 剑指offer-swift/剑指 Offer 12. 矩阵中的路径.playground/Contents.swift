import Cocoa

class Solution {
    
    func dfs(_ board: inout [[Character]], _ words: [Character], _ count: Int, _ row: Int, _ column: Int) -> Bool {
        guard count < words.count else {
            return true
        }

        guard row >= 0 && row < board.count && column >= 0 && column < board[0].count && board[row][column] == words[count] else {
            return false
        }
        
        board[row][column] = Character("_")
        let res = dfs(&board, words, count + 1, row - 1, column) ||
            dfs(&board, words, count + 1, row + 1, column) ||
            dfs(&board, words, count + 1, row, column - 1) ||
            dfs(&board, words, count + 1, row, column + 1)
        board[row][column] = words[count]
        return res
    }
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard !word.isEmpty else {
            return true
        }
        
        guard !board.isEmpty && !board[0].isEmpty else {
            return false
        }
        
        var board = board
        for row in 0..<board.count {
            for column in 0..<board[0].count {
                if board[row][column] == word.first! && dfs(&board, Array(word), 0, row, column) {
                    return true
                }
            }
        }
        
        
        return false
    }
}

let solution = Solution()
//print(solution.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"))
//print(solution.exist([["a","b"],["c","d"]], "abcd"))
print(solution.exist([["C","A","A"],["A","A","A"],["B","C","D"]], "AAB"))
