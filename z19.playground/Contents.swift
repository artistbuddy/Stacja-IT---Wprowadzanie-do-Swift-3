func checkPesel(_ pesel: String) -> Bool {
    if let pesel = Int(pesel) {
        return checkPesel(pesel)
    }
    
    return false
}

func checkPesel(_ pesel: Int) -> Bool {
    if pesel.description.characters.count != 11 {
        return false
    }
    
    let weights = [1,3,7,9,1,3,7,9,1,3,1]
    let digits = pesel.description.characters.flatMap{Int(String($0))}
    
    var sum = 0
    for (i, digit) in digits.enumerated() {
        sum += digit*weights[i]
    }
    
    if sum%10 != 0 {
        return false
    }
    
    return true
}

let pesel1 = "49040501580" //good
let pesel2 = 44051401358 //wrong

print("Is \(pesel1) valid? \(checkPesel(pesel1))")
print("Is \(pesel2) valid? \(checkPesel(pesel2))")

