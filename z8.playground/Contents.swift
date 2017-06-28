import Foundation

var occur = [Int:Int]()
var numbers = [Int]()

for _ in 1...20 {
    numbers.append(Int(arc4random_uniform(10) + 1))
}

for number in numbers {
    if let count = occur[number] {
        occur[number] = count + 1
    } else {
        occur[number] = 1
    }
}

print("Random numbers: \(numbers)")
print("Occurrences: \(occur)")