import Cocoa

func addStrings(_ num1: String, _ num2: String) -> String {
    guard !num1.isEmpty else {
        return num2
    }
    guard !num2.isEmpty else {
        return num1
    }
    
    let num1Arr: [Character] = Array(num1)
    let num2Arr: [Character] = Array(num2)
    
    let n1 = num1.count
    let n2 = num2.count
    var carry = 0, remain = 0
    var count = 1
    var res = [String]()
    while (n1 - count) >= 0 || (n2 -  count) >= 0 {
        let c1 = (n1 - count) >= 0 ? num1Arr[n1 - count].wholeNumberValue! : 0
        let c2 = (n2 - count) >= 0 ? num2Arr[n2 - count].wholeNumberValue! : 0
        let value = c1 + c2 + carry
        remain = value % 10
        carry = value / 10
        res.append(String(remain))
        count += 1
    }
    
    if carry >= 1 {
        res.append("1")
    }
    return res.reversed().joined()
}

print(addStrings("11", "123"))
print(addStrings("456", "77"))
print(addStrings("0", "0"))
print(addStrings("99", "2"))
