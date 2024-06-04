//
//  409.swift
//  Leetcode
//
//  Created by polaris dev on 2024/6/4.
//

import Foundation

//Given a string s which consists of lowercase or uppercase letters, return the length of the longest
//palindrome
// that can be built with those letters.
//
//Letters are case sensitive, for example, "Aa" is not considered a palindrome.
//
// 
//
//Example 1:
//
//Input: s = "abccccdd"
//Output: 7
//Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.
//Example 2:
//
//Input: s = "a"
//Output: 1
//Explanation: The longest palindrome that can be built is "a", whose length is 1.
// 
//
//Constraints:
//
//1 <= s.length <= 2000
//s consists of lowercase and/or uppercase English letters only.

class Solution409 {
    func longestPalindrome(_ s: String) -> Int {
        var hash: [Character: Int] = [:]
        s.forEach { hash[$0, default: 0] += 1 }
        var cnt = 0, flag = false
        for value in hash.values {
            if value % 2 == 1 {
                flag = true
                cnt += value - 1
            } else {
                cnt += value
            }
        }
        return flag ? cnt + 1 : cnt
    }
    
    func test() {
        let s = "civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"
        print(longestPalindrome(s)) // 983
    }
    
}
