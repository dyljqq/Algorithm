import UIKit

class ComplexNumberMultiplication {
    
    func helper(_ num: String) -> (Int, Int) {
        let arr = num.split(separator: "+")
        return (Int(arr[0]) ?? 0, Int(String(arr[1].dropLast())) ?? 0)
    }
    
    func complexNumberMultiply(_ num1: String, _ num2: String) -> String {
        let (a1, b1) = helper(num1)
        let (a2, b2) = helper(num2)
        
        let a = a1 * a2 - b1 * b2
        let b = a1 * b2 + a2 * b1
        
        return "\(a)+\(b)i"
    }
    
    func test() {
        print(complexNumberMultiply("1+1i", "1+1i"))
        print(complexNumberMultiply("1+-1i", "1+-1i"))
    }
    
}
