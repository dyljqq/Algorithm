//
//  ExcelSheetColumnTitle.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/9/27.
//

import Foundation

class ExcelSheetColumnTitle {

    func convertToTitle(_ columnNumber: Int) -> String {
        var columnNumber = columnNumber
        
        var res = ""
        while columnNumber > 0 {
            let a0 = (columnNumber - 1) % 26 + 1
            res += String(format: "%c", Character("A").asciiValue! + UInt8(a0) - 1)
            columnNumber = (columnNumber - a0) / 26
        }
        return String(res.reversed())
    }
    
    func test() {
        print(convertToTitle(1))
        print(convertToTitle(28))
        print(convertToTitle(701))
        print(convertToTitle(2147483647))
    }
}
