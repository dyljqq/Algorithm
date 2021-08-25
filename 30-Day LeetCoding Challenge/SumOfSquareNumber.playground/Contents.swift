import UIKit

class SumOfSquareNumber {
    
    func judgeSquareSum(_ c: Int) -> Bool {
        guard c >= 0 else {
            return false
        }
        
        var a = 0, b = Int(sqrt(Double(c)))
        while a <= b {
            let sum = a * a + b * b
            if sum == c {
                return true
            } else if sum < c {
                a = a + 1
            } else {
                b = b - 1
            }
        }
        return false
    }
    
    func test() {
        print(judgeSquareSum(2))
        (1...5).forEach { print(judgeSquareSum($0)) }
    }
    
}
