### 673. Number of Longest Increasing Subsequence

Given an integer array `nums`, return *the number of longest increasing subsequences.*

**Notice** that the sequence has to be **strictly** increasing.

##### 题目的意思

给定一个数组，返回最长的所有严格递增的子序列的数目。

ps: 严格递增是指不能存在a[i] == a[i + 1]，即相等的情况。

#### 题解:

首先看到题目的第一反应就是动态规划，通过前面的状态推导出后面的状态，因此，就是如何找状态方程：

给出定义：

i > j, 从0..<i中找到符合nums[i] > nums[j]的值，符合这样的j，就可以组合成一个更长的子序列。

那么dp[i] = dp[j] + 1，如果说只是让我们去找寻最长子序列的长度，那么通过这个状态方程式，最后遍历dp查找到最大的值（dp[i]）即可。

但是题目的意思是要找到符合最长子序列，且这样的子序列有多少个，那么这个时候，我们需要有另一个数组去记录dp[i]所对应的个数cnt[i].

这个时候，我们就要分开讨论：

如果dp[i] < dp[j] + 1, 那么dp[i] = dp[j] + 1, 且需要重置cnt[i]。为什么呢，因为这个时候的dp[i]是最长的。

如果dp[i] == dp[j] + 1, 那么说明之前有一条或多条最长的子序列到达过i，因此我们需要累加cnt[i]，即cnt[i] = cnt[i] + cnt[j]。

遍历完i之后，我们需要查找dp[i]是否满足dp[i] > maxLength, 如果满足，那么：

maxLength = dp[i],

ans = cnt[i] // ans为最终的解

如果dp[i] == maxLength: ans += cnt[i].



最后输出ans。



建议代入特定的测试用例，去验证状态方程。如:

**Example 1:**

```
Input: nums = [1,3,5,4,7]
Output: 2
Explanation: The two longest increasing subsequences are [1, 3, 4, 7] and [1, 3, 5, 7].
```

**Example 2:**

```
Input: nums = [2,2,2,2,2]
Output: 5
Explanation: The length of the longest increasing subsequence is 1, and there are 5 increasing subsequences of length 1, so output 5.
```

#### 代码

```swift
class Leetcode673 {
    
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 1, count: nums.count + 1)
        var cnt = Array(repeating: 1, count: nums.count + 1)
        
        var mx = 0
        var ans = 0
        for i in 0..<nums.count {
            for j in 0..<i {
                guard nums[j] < nums[i] else { continue }
                if dp[i] < (dp[j] + 1) {
                    dp[i] = dp[j] + 1
                    cnt[i] = cnt[j]
                } else if dp[i] == (dp[j] + 1) {
                    cnt[i] = cnt[i] + cnt[j]
                }
            }
            
            if dp[i] > mx {
                mx = dp[i]
                ans = cnt[i]
            } else if dp[i] == mx {
                ans += cnt[i]
            }
        }
        
        return ans
    }
    
}
```

