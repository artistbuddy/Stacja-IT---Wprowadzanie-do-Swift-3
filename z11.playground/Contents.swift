func randomIntArr(range: CountableClosedRange<Int>) -> [Int] {
    var arr = [Int]()
    
    for _ in 1...5 {
        arr.append(random(from: range))
    }
    
    return arr
}

var matrix = [[Int]]()
for _ in 1...5 {
    matrix.append(randomIntArr(range: -5...5))
}

for row in matrix {
    print(row)
}

var mins = [Int]()
var maxs = [Int]()

for index in 0 ..< 5{
    var min = matrix.reduce(0) {
        (min: Int, next: [Int]) -> Int in
        if next[index] < min {
            return next[index]
        }
        
        return min
    }
    mins.append(min)
    
    var max = matrix.reduce(0) {
        (max: Int, next: [Int]) -> Int in
        if next[index] > max {
            return next[index]
        }
        
        return max
    }
    maxs.append(max)
}

print("Mins: \(mins)")
print("Maxs: \(maxs)")

