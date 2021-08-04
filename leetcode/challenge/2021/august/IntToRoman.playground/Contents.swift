import Cocoa

func intToRoman(_ num: Int) -> String {
    let thousandMappings = ["", "M", "MM", "MMM"]
    let hunderdMappings = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
    let tensMappings = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
    let oneMappings = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
    
    let thousands = num.quotientAndRemainder(dividingBy: 1000)
    let hundreds = thousands.remainder.quotientAndRemainder(dividingBy: 100)
    let tens = hundreds.remainder.quotientAndRemainder(dividingBy: 10)
    
    return "\(thousandMappings[thousands.quotient])\(hunderdMappings[hundreds.quotient])\(tensMappings[tens.quotient])\(oneMappings[tens.remainder])"
    
}

print(intToRoman(3))
print(intToRoman(4))
print(intToRoman(9))
print(intToRoman(58))
print(intToRoman(1994))
