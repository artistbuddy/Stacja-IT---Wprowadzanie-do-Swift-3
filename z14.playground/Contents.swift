let message = "Top secret"

//Very swifty but I'm not sure it's proper Caesar cipher
func caesarCipher(plainText: String, shift: Int) -> String {
    return plainText.unicodeScalars.map{$0.value.advanced(by: shift) }.reduce(""){$0 + UnicodeScalar($1)!.description}
}

let secret = caesarCipher(plainText: message, shift: 2)

print("\(message) -> \(secret)")
print("\(secret) -> \(message)")

