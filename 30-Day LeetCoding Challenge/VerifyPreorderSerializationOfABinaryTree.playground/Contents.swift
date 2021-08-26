import UIKit

class VerifyPreorderSerializationOfABinaryTree {
    
    func isValidSerialization(_ preorder: String) -> Bool {
        guard !preorder.isEmpty else {
            return true
        }
        
        var stack: [String] = []
        let nums = preorder.split(separator: ",")
        for num in nums {
            stack.append(String(num))

            while stack.count >= 3 && stack[stack.count - 1] == "#" && stack[stack.count - 2] == "#" && stack[stack.count - 3] != "#" {
                stack = stack.dropLast(3)
                stack.append("#")
            }
        }
        
        return stack.count == 1 && stack[0] == "#"
    }
    
    func test() {
        print(isValidSerialization("9,3,4,#,#,1,#,#,2,#,6,#,#"))
    }
    
}
