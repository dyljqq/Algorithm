import Cocoa

func minFlipsMonoIncr(_ s: String) -> Int {
    var flipOne = 0
    var flipZero = 0
    for c in s {
        flipZero = flipZero + (c == "1" ? 1 : 0)
        flipOne = min(flipZero, flipOne + (c == "0" ? 1 : 0))
    }
    return flipOne
}

print(minFlipsMonoIncr("00110"))
print(minFlipsMonoIncr("010110"))
print(minFlipsMonoIncr("00011000"))
