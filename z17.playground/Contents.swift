import Foundation

struct Rectangle {
    let width: Double
    let height: Double
    var area: Double {
        return width * height
    }
    var perimeter: Double {
        return 2 * width + 2 * height
    }
    var diagonal: Double {
        return (height * height + width * width).squareRoot()
    }
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
//    func area() -> Double {
//        return width * height
//    }
//    
//    func perimeter() -> Double {
//        return 2 * width + 2 * height
//    }
//    
//    func diagonal() -> Double {
//        return (height * height + width * width).squareRoot()
//    }
}

let rect = Rectangle(width: 5.0, height: 5.0)
print("Pole: \(rect.area)")
print("Obwód: \(rect.perimeter)")
print("Przekątna: \(rect.diagonal)")

//let rect = Rectangle(width: 5.0, height: 5.0)
//print("Pole: \(rect.area())")
//print("Obwód: \(rect.perimeter())")
//print("Przekątna: \(rect.diagonal())")
