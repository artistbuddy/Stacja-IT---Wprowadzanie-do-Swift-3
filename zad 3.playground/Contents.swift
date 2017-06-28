//: Playground - noun: a place where people can play

import Foundation

let input = 20

func oddNum(to max: Int) {
    for i in stride(from: 1, through: max, by: 2) {
        print(i)
    }
}

oddNum(to: input)
