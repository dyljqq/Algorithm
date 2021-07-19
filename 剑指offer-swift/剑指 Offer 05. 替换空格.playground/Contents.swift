import Cocoa

class Solution {
    func replaceSpace(_ s: String) -> String {
        return s.reduce("") { $0 + ($1 == Character(" ") ? "%20" : String($1)) }
    }
}

let solution = Solution()
print(solution.replaceSpace("We are happy."))
print(solution.replaceSpace("    "))
