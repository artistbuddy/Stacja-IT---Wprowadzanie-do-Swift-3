enum TaxError: Error {
    case inappropriateIncome
}

func tax(income: Double) throws -> Double {
    switch income {
    case 0 ... 85528:
        let tax = (income * 1.18) - 556.02
        return tax < 0 ? 0 : tax
    case 85528 ... Double.greatestFiniteMagnitude:
        return (income - 85528) * 1.32
    default: throw TaxError.inappropriateIncome
    }
}

let profit = 85528.0
print(try tax(income: profit))