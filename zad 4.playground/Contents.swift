//: Playground - noun: a place where people can play

import Foundation

enum Bmi {
    case niedowaga, nadwaga, wagaPrawidłowa
}

func bmi(weight: Double, height: Double) -> (bmi: Bmi?, result: Double) {
    let result = weight / (height * height) * 10000
    
    switch result {
    case 0 ... 18.4: return (Bmi.niedowaga, result)
    case 18.5 ... 24.9: return (Bmi.wagaPrawidłowa, result)
    case 25 ... 200: return (Bmi.nadwaga, result)
    default: return (nil, result)
    }
}

bmi(weight: 444.0, height: 169.0) //Keith Martin