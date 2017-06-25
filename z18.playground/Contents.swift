protocol Figure {
    func getPerimeter() -> Double
    func getArea() -> Double
}

class Circle: Figure {
    let radius: Double
    var diameter: Double {
        get {
            return radius * 2
        }
    }
    
    init?(radius: Double) {
        guard radius > 0 else {
            return nil
        }
        
        self.radius = radius
    }
    
    //MARK:- Figure
    func getArea() -> Double {
        return Double.pi * radius * radius
    }
    
    func getPerimeter() -> Double {
        return 2 * Double.pi * radius
    }
}

class Triangle: Figure {
    struct Properties {
        var side: Double
        var altitude: Double
//        let angle: Double
        
        init?(side: Double, altitude: Double) {
            guard side > 0, altitude > 0 else {
                return nil
            }
            
            self.side = side
            self.altitude = altitude
        }
    }
    
    let a: Properties
    let b: Properties
    let c: Properties
    
    init?(a: Properties, b: Properties, c: Properties) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    //MARK:- Figure
    func getArea() -> Double {
        return (a.side + a.altitude)/2 + (b.side + b.altitude)/2 + (c.side + c.altitude)/2
    }
    
    func getPerimeter() -> Double {
        return a.side + b.side + c.side
    }
}

class Equilateral: Triangle {
    init?(side: Double, altitude: Double) {
        guard let property = Properties(side: side, altitude: altitude) else {
            return nil
        }
        super.init(a: property, b: property, c: property)
    }
}

class Rectangle: Figure {
    let sideA: Double
    let sideB: Double
    
    init?(width: Double, height: Double) {
        guard width > 0, height > 0 else {
            return nil
        }
        
        self.sideA = width
        self.sideB = height
    }
    
    //MARK:- Figure
    func getArea() -> Double {
        return sideA * sideB
    }
    
    func getPerimeter() -> Double {
        return sideA * 2 + sideB * 2
    }
}

class Square: Rectangle {
    var diagonal: Double {
        get {
            return sideA * 2.squareRoot()
        }
    }
    
    init?(width: Double) {
        super.init(width: width, height: width)
    }
}

if let figure = Square(width: 10.0) {
    print("Square")
    print(figure.getArea())
    print(figure.getPerimeter())
}

if let figure = Equilateral(side: 10.0, altitude: 5.0) {
    print("Equilateral triangle")
    print(figure.getArea())
    print(figure.getPerimeter())
}

if let figure = Circle(radius: 10.0) {
    print("Circle")
    print(figure.getArea())
    print(figure.getPerimeter())
}


