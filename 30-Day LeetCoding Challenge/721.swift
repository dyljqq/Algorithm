//
//  721.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/29.
//

import Foundation

/// 721. Accounts Merge
/// https://leetcode.com/problems/accounts-merge/
class Leetcode721 {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        // Initialize parent dictionary.
        var parent: [Int: Int] = [:]
        for i in 0..<accounts.count {
            parent[i] = i
        }
        
        // find function for union find.
        func find(_ i: Int) -> Int {
            var i = i
            while i != parent[i] {
                i = parent[i]!
            }
            return i
        }
        
        var emailToIndex: [String: Int] = [:]
        for (i, account) in accounts.enumerated() {
            for j in 1..<account.count {
                let email = account[j]
                if let idx = emailToIndex[email] {
                    // Union.
                    parent[find(i)] = find(idx)
                } else {
                    emailToIndex[email] = i
                }
            }
        }
        
        var merged: [Int: [String]] = [:]
        for email in emailToIndex.keys {
            // Find the root index for that group.
            let rootIndex = find(emailToIndex[email]!)
            if merged[rootIndex] == nil {
                merged[rootIndex] = []
            }
            merged[rootIndex]!.append(email)
        }
        
        var res: [[String]] = []
        for (i, emails) in merged {
            var emails = emails
            emails.sort()
            res.append([accounts[i][0]] + emails)
        }
        
        return res
    }
}
