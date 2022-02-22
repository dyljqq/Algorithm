//
//  171.swift
//  Leetcode
//
//  Created by 季勤强 on 2022/2/22.
//

import Foundation

/**
 171. Excel Sheet Column Number
 https://leetcode.com/problems/excel-sheet-column-number/
 
 就是将字符串转化为26进制
 */

class Leetcode171 {
    
    func titleToNumber(_ columnTitle: String) -> Int {
        return columnTitle.unicodeScalars.reduce(0) { $0 * 26 + (Int($1.value) - 64) }
    }
    
}
