import UIKit

func canReorderDoubled(_ arr: [Int]) -> Bool {
    guard !arr.isEmpty, arr.count % 2 == 0 else {
        return false
    }
    
    var hash: [Int: Int] = [:]
    arr.forEach { hash[$0] = (hash[$0] ?? 0) + 1 }
    
    let keys = hash.keys.sorted(by: { abs($0) < abs($1) })
    for key in keys {
        guard let n = hash[key], n >= 0 else {
            return false
        }
        hash[2 * key, default: 0] -= n
        hash[key] = 0
    }
    
    return hash.values.filter { $0 != 0 }.count == 0
}

print(canReorderDoubled([3,1,3,6]))
print(canReorderDoubled([2,1,2,6]))
print(canReorderDoubled([4,-2,2,-4]))
print(canReorderDoubled([1,2,4,16,8,4]))
print(canReorderDoubled([1,2,4,8]))
print(canReorderDoubled([2,4,0,0,8,1]))
print(canReorderDoubled([2,1,2,6]))
