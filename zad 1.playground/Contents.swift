//: Playground - noun: a place where people can play

import Foundation

let input1 = 6
let input2 = 1
let input3 = 5

let userInput = [input1, input2, input3]

//var min = 0
//var max = 0
//
//for number in userInput {
//    if number < min {
//        min = number
//    }
//    
//    if number > max {
//        max = number
//    }
//}
//
//print(min, max)


func finder(userInput: [Int]) -> (min: Int?, max: Int?) {
    var min: Int? = userInput.first
    var max: Int? = userInput.first
    
    for number in userInput {
        
//        if min != nil && number < min! {
//            min! = number
//        }
//        
//        if max != nil && number > max! {
//            max! = number
//        }
        
        if let unwrappedMin = min, number < unwrappedMin {
            min = number
        }
        
        if let unwrappedMax = max, number < unwrappedMax {
            max = unwrappedMax
        }
    }
    
    return (min, max)
}

let output = finder(userInput: userInput)
print(output)


