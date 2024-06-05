//
//  1002.swift
//  Leetcode
//
//  Created by polaris dev on 2024/6/5.
//

import Foundation

//Given a string array words, return an array of all characters that show up in all strings within the words (including duplicates). You may return the answer in any order.
//
// 
//
//Example 1:
//
//Input: words = ["bella","label","roller"]
//Output: ["e","l","l"]
//Example 2:
//
//Input: words = ["cool","lock","cook"]
//Output: ["c","o"]
// 
//
//Constraints:
//
//1 <= words.length <= 100
//1 <= words[i].length <= 100
//words[i] consists of lowercase English letters.

class Solution1002 {
//    func commonChars(_ words: [String]) -> [String] {
//        var hash: [Character: Int] = [:]
//        for (index, word) in words.enumerated() {
//            if index == 0 {
//                for ch in word {
//                    hash[ch, default: 0] += 1
//                }
//            } else {
//                var temp: [Character: Int] = [:]
//                for ch in word {
//                    if let value = hash[ch], value > 0 {
//                        hash[ch] = value - 1
//                        temp[ch, default: 0] += 1
//                    }
//                }
//                hash = temp
//            }
//        }
//        var rs: [String] = []
//        for (key, value) in hash {
//            rs.append(contentsOf: (0..<value).map { _ in String(key) })
//        }
//        return rs
//    }
    
    func commonChars(_ words: [String]) -> [String] {
        var result = [Int](repeating: .max, count: 26)
        
        for word in words {
            var count = [Int](repeating: 0, count: 26)
            for letter in word {
                count[Int(letter.asciiValue! - Character("a").asciiValue!)] += 1
            }
            for i in 0..<26 {
                result[i] = min(result[i], count[i])
            }
        }
        
        var output = [String]()
        for i in 0..<26 {
            for _ in 0..<result[i] {
                output.append(String(Character(UnicodeScalar(i + Int(Character("a").asciiValue!))!)))
            }
        }
        return output
    }
    
    func test() {
        print(commonChars(["bella","label","roller"]))
        print(commonChars(["cool","lock","cook"]))
    }
    
}
