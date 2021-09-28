//
//  UniqueEmailAddress.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/9/28.
//

import Foundation

class UniqueEmailAddress {
    
    func numUniqueEmails(_ emails: [String]) -> Int {
        var set = Set<String>()
        for email in emails {
            let arr = email.split(separator: "@")
            if arr.count != 2 {
                continue
            }
            let domain = arr[1]
            var locals: [Character] = []
            for local in Array(arr[0]) {
                if String(local) == "+" {
                    break
                } else if String(local) != "." {
                    locals.append(local)
                }
            }
            set.insert(String(locals) + "@" + String(domain))
        }
        return set.count
    }
    
    func test() {
        print(numUniqueEmails(["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]))
        print(numUniqueEmails(["a@leetcode.com","b@leetcode.com","c@leetcode.com"]))
        print(numUniqueEmails(["test.email+alex@leetcode.com","test.email.leet+alex@code.com"]))
    }
}
