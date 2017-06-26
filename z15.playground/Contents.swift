import Foundation

let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."

func wordCount(text: String) -> Int {
    if text.characters.count == 0 {
        return 0
    }
    
    let components = text.components(separatedBy: .whitespaces)
    let words = components.filter{$0 != ""}
    
    return words.count
}

print("\'\(text)\' has \(wordCount(text: text)) word(s).")
