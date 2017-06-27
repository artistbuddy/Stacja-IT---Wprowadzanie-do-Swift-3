let input = "konstantynopolitańczykowianeczka"

func checkoccurrencies(text: String) -> Int {
    if text.characters.count == 0 {
        return 0
    }
    
    if text.characters.count == 1 {
        return 1
    }
    
    var count = 0
    
    for char in text.characters {
        if char == text.characters.last! {
            count += 1
        }
    }
    
    return count
}

func checkoccurrencies2(text: String) -> Int {
    if text.characters.count == 0 {
        return 0
    }
    
    if text.characters.count == 1 {
        return 1
    }
    
    var occurs = text.characters.filter{ $0 == text.characters.last! }
    
    return occurs.count
}

print(checkoccurrencies(text: input))
print(checkoccurrencies2(text: input))