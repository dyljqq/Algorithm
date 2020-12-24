//
//  ransomNote.swift
//  Leetcode
//
//  Created by 季勤强 on 2020/12/24.
//

import Foundation

class RansomNote {
    
    func constructDict(_ str: String) -> Dictionary<Character, Int> {
        var d = Dictionary<Character, Int>()
        let _ = str.map { d[$0] = (d[$0] ?? 0) + 1 }
        return d
    }
    
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        let ransomDict = constructDict(ransomNote)
        let magazineDict = constructDict(magazine)
        for (c, value) in ransomDict {
            let mv = magazineDict[c] ?? 0
            if mv < value {
                return false
            }
        }
        return true
    }
    
    func test() {
        print(canConstruct("aa", "ab"))
        print(canConstruct("aa", "aab"))
    }
    
}
