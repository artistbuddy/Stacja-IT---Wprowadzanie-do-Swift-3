enum CreditError: Error {
    case wrongPrice, wrongMonths
}

func installment(price: Double, months: Int) throws -> Double {
    guard (100.0...10000.0).contains(price) else {
        throw CreditError.wrongPrice
    }
    
    guard (6...48).contains(months) else {
        throw CreditError.wrongPrice
    }

    switch months {
    case 6...12:
        return (price * 1.025) / Double(months)
    case 13...24:
        return (price * 1.05) / Double(months)
    case 25...48:
        return (price * 1.1) / Double(months)
    default: return 0.0
    }
}



do {
    print("Miesięczna rata: \(try installment(price: 1000, months: 10))")
} catch let error as CreditError {
    switch error {
    case .wrongPrice:
        print("Kredyt dostępny w przedziale cen 100 - 10000")
    case .wrongMonths:
        print("Kredyt dostępny w przedziele miesięcy 6 - 48")
    }
}