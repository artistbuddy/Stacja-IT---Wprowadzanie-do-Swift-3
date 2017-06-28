//: Playground - noun: a place where people can play

import Foundation

let celsius = 30.0

func c2f(temp: Double) -> Double {
    return 1.8 * temp + 32.0
}

print(c2f(temp: celsius))