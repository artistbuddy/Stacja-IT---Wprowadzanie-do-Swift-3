
class A {
    struct Properties {
        var side: Double
        var altitude: Double
        //        let angle: Double
        
        init(side: Double, altitude: Double) {
            self.side = side
            self.altitude = altitude
        }
    }
    
    let a: Properties
    
    init(a: Properties) {
        self.a = a
    }
}
