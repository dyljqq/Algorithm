import UIKit

class PascalTraiangle {
    
    func generate(_ numRows: Int) -> [[Int]] {
        var results = [[Int]]()
        guard numRows > 0 else {
            return results
        }
        
        results.append([1])
        for row in 1..<numRows {
            var temps: [Int] = [1]
            let last = results.last!
            for i in 1..<row {
                temps.append(last[i] + last[i - 1])
            }
            temps.append(1)
            results.append(temps)
        }
        return results
    }
    
    func test() {
        print(generate(5))
        print(generate(1))
    }
    
}
