//
//  floodFill.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/1/4.
//

import Foundation

class FloodFill {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        guard !image.isEmpty || image[sr][sc] != newColor  else {
            return image
        }
        
        var image = image
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        var stack: [(Int, Int)] = [(sc, sr)]
        let value = image[sr][sc]
        
        while !stack.isEmpty {
            let (sc, sr) = stack.popLast()!
            image[sr][sc] = newColor
            
            for dir in directions {
                let (x, y) = (sc + dir.0, sr + dir.1)
                if x >= 0 && x < image[0].count && y >= 0 && y < image.count && image[y][x] == value && image[y][x] != newColor {
                    image[y][x] = newColor
                    stack.append((x, y))
                }
            }
        }
        
        return image
    }
    
    func test() {
        print(floodFill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2))
        print(floodFill([[0,0,0],[1,0,0]], 1, 0, 2))
    }
}
