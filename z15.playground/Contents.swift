import Foundation

let text = "Drogi Marszałku, Wysoka Izbo. PKB rośnie Nikt inny was nie tak zostawić. Jednakowoż, rozszerzenie naszej kompetencji w tym zakresie pomaga w określaniu systemu, ale ukończenie aktualnych projektów koliduje z szerokim aktywem, który wymaga niezwykłej precyzji w przygotowaniu i realizacji obecnej sytuacji."

func wordCount(text: String) -> Int {
    if text.characters.count == 0 {
        return 0
    }
    
    let components = text.components(separatedBy: .whitespaces)
    let words = components.filter{$0 != ""}
    
    return words.count
}

print("Text has \(wordCount(text: text)) word(s).")

func isWhitespace(char: Character) -> Bool {
    let whitespaces: [Character] = ["\u{0020}", "\u{0009}", "\u{000A}", "\u{000B}", "\u{000C}", "\u{000D}"]
    for whitespace in whitespaces {
        if char == whitespace {
            return true
        }
    }
    return false
}

func monkeySeek(text: String) -> Int {
    var foundWords = 0
    var seeking = false
    
    for char in text.characters {
        switch (isWhitespace(char: char), seeking) {
        case (false, false): //start seeking
            seeking = true
        case (false, true): //contiune seeking
            continue
        case (true, true): //stop seeking
            foundWords += 1
            seeking = false
        case (true, false): //ignore whitespaces
            continue
        }
    }
    
    if !isWhitespace(char: text.characters.last!) {
        foundWords += 1
    }

    return foundWords
}

print("🐒 says: \(monkeySeek(text: text)) word(s) found too")

func apeSeek(text: String) -> [String] {
    var seeking = false
    var wordBeginning: Int = 0 //index
    var foundWords = [String]()
    
    func extractWord(start: Int, end: Int) -> String {
        let startIndex = text.index(text.startIndex, offsetBy: start)
        let endIndex = text.index(text.startIndex, offsetBy: end)
        
        return text.substring(with: Range(uncheckedBounds: (lower: startIndex, upper: endIndex)))
    }
    
    for (index, char) in text.characters.enumerated() {
        switch (isWhitespace(char: char), seeking) {
        case (false, false): //start seeking
            seeking = true
            wordBeginning = index
        case (false, true): //contiune seeking
            continue
        case (true, true): //stop seeking
            foundWords.append(extractWord(start: wordBeginning, end: index))
            seeking = false
        case (true, false): //ignore whitespaces
            continue
        }
    }
    
    if !isWhitespace(char: text.characters.last!) {
        foundWords.append(extractWord(start: wordBeginning, end: text.characters.count))
    }
    
    return foundWords
}

let ape = apeSeek(text: text)
print("🦍 says: \(ape.count) word(s) found: \(ape)")