let text = "kobyła ma mały bok"

func isPalindrome(_ text: String) -> Bool {
    let trimmed = String(text.characters.filter{$0 != " "})
    
    return trimmed.characters.reversed().reduce(""){$0 + String($1)} == trimmed
}

print(isPalindrome(text))