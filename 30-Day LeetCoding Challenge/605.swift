//
//  605.swift
//  Leetcode
//
//  Created by 季勤强 on 19-01-22.
//

import Foundation

class Leetcode605 {
    
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var flowerbed = flowerbed, count = n, i = 1
        flowerbed.insert(0, at: 0)
        flowerbed.append(0)
        
        while i < flowerbed.count - 1 {
            if count == 0 {
                return true
            }
            if flowerbed[i - 1] + flowerbed[i] + flowerbed[i + 1] == 0 {
                count -= 1
                i += 1
            }
            i += 1
        }
        return count <= 0
    }
    
    func test() {
        print(canPlaceFlowers([1,0,0,0,1], 1))
        print(canPlaceFlowers([1,0,0,0,1], 2))
    }
    
}
