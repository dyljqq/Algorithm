//
//  735.swift
//  Leetcode
//
//  Created by polaris dev on 2023/7/20.
//

import Foundation

class Leetcode735 {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack: [Int] = []
        guard !asteroids.isEmpty else { return [] }
        stack.append(asteroids[0])
        for asteroid in asteroids.dropFirst() {
            if stack.isEmpty {
                stack.append(asteroid)
                continue
            }
            if asteroid > 0 {
                stack.append(asteroid)
            } else {
                while let top = stack.last {
                    if top < 0 {
                        stack.append(asteroid)
                        break
                    } else {
                        if abs(asteroid) > top {
                            stack.popLast()
                            if stack.isEmpty {
                                stack.append(asteroid)
                                break
                            }
                        } else if abs(asteroid) == top {
                            stack.popLast()
                            break
                        } else {
                            break
                        }
                    }
                }
            }
        }
        return stack
    }
    
    func test() {
//        print(asteroidCollision([5,10,-5]))
//        print(asteroidCollision([8,-8]))
//        print(asteroidCollision([10,2,-5]))
//        print(asteroidCollision([-2,-1,1,2]))
//        print(asteroidCollision([10, 5, 6, -11]))
        print(asteroidCollision([1,-1,-2,-2]))
    }
}
