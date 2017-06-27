var numbers = [Int]()

for _ in 1...10 {
    numbers.append(random(from: -10...10))
}

print(numbers)

print("min: \(numbers.min()!)")
print("max: \(numbers.max()!)")

let avg = Double((numbers.reduce(0,+)))/Double(numbers.count)
print("Average: \(avg)")

print("Below avg: \(numbers.filter{Double($0) < avg}.count)")
print("Above avg: \(numbers.filter{Double($0) > avg}.count)")

print(Array(numbers.reversed()))
