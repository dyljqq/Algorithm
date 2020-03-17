//
//  FindWordsThatCanBeFormedByCharacters.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/17.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class FindWordsThatCanBeFormedByCharacters {
  
  func helper(_ word: String, _ hash: [Character: Int]) -> Bool {
    var hash = hash
    for c in word {
      if let num = hash[c], num > 0 {
        hash[c] = hash[c]! - 1
      } else {
        return false
      }
    }
    return true
  }
  
  func countCharacters(_ words: [String], _ chars: String) -> Int {
    guard !(words.isEmpty && chars.isEmpty)  else {
      return 0
    }
    
    var hash: [Character: Int] = [:]
    for c in chars {
      hash[c] = (hash[c] ?? 0) + 1
    }
    return words.filter { helper($0, hash) }.reduce(0) { $0 + $1.count }
  }
  
  func test() {
//    print(countCharacters(["cat","bt","hat","tree"], "atach"))
//    print(countCharacters(["hello","world","leetcode"], "welldonehoneyr"))
    print(countCharacters(["dyiclysmffuhibgfvapygkorkqllqlvokosagyelotobicwcmebnpznjbirzrzsrtzjxhsfpiwyfhzyonmuabtlwin","ndqeyhhcquplmznwslewjzuyfgklssvkqxmqjpwhrshycmvrb","ulrrbpspyudncdlbkxkrqpivfftrggemkpyjl","boygirdlggnh","xmqohbyqwagkjzpyawsydmdaattthmuvjbzwpyopyafphx","nulvimegcsiwvhwuiyednoxpugfeimnnyeoczuzxgxbqjvegcxeqnjbwnbvowastqhojepisusvsidhqmszbrnynkyop","hiefuovybkpgzygprmndrkyspoiyapdwkxebgsmodhzpx","juldqdzeskpffaoqcyyxiqqowsalqumddcufhouhrskozhlmobiwzxnhdkidr","lnnvsdcrvzfmrvurucrzlfyigcycffpiuoo","oxgaskztzroxuntiwlfyufddl","tfspedteabxatkaypitjfkhkkigdwdkctqbczcugripkgcyfezpuklfqfcsccboarbfbjfrkxp","qnagrpfzlyrouolqquytwnwnsqnmuzphne","eeilfdaookieawrrbvtnqfzcricvhpiv","sisvsjzyrbdsjcwwygdnxcjhzhsxhpceqz","yhouqhjevqxtecomahbwoptzlkyvjexhzcbccusbjjdgcfzlkoqwiwue","hwxxighzvceaplsycajkhynkhzkwkouszwaiuzqcleyflqrxgjsvlegvupzqijbornbfwpefhxekgpuvgiyeudhncv","cpwcjwgbcquirnsazumgjjcltitmeyfaudbnbqhflvecjsupjmgwfbjo","teyygdmmyadppuopvqdodaczob","qaeowuwqsqffvibrtxnjnzvzuuonrkwpysyxvkijemmpdmtnqxwekbpfzs","qqxpxpmemkldghbmbyxpkwgkaykaerhmwwjonrhcsubchs"],
    "usdruypficfbpfbivlrhutcgvyjenlxzeovdyjtgvvfdjzcmikjraspdfp"))
  }
  
}
