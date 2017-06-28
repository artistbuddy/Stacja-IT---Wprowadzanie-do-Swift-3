import Foundation

struct Store {
    static private var _mini: Int? = nil
    static var mini: Int? {
        get {
            return Store._mini
        }
        set {
            if Store._mini == nil {
                Store._mini = newValue
            } else {
                if let number = newValue {
                    Store._mini = min(Store._mini!, number)
                } else {
                    Store._mini = nil
                }
            }
        }
    }
    static private var _maxi: Int? = nil
    static var maxi: Int? {
        get {
            return Store._maxi
        }
        set {
            if Store._maxi == nil {
                Store._maxi = newValue
            } else {
                if let number = newValue {
                    Store._maxi = max(Store._maxi!, number)
                } else {
                    Store._maxi = nil
                }
            }
        }
    }
    static private var count = 0
    static private var _sum: Int? = nil
    static var sum: Int? {
        get {
            return Store._sum
        }
        set {
            if newValue == nil {
                Store._sum = newValue
                Store.count = 0
            } else {
                Store._sum = newValue
                Store.count += 1
            }
        }
    }
    static var average: Double? {
        guard Store.sum != nil else {
            return nil
        }
        
        return Double(Store.sum!) / Double(Store.count)
    }
}

repeat {
    let input = String(arc4random_uniform(20)) //simulate readLine()
    print("Input: \(input)")
    
    if let number = Int(input) {
        if number == 0 {
            print("Minimum: \(Store.mini)")
            print("Maximum: \(Store.maxi)")
            print("Average: \(Store.average)")
            break
        }
        
        Store.sum = number
        Store.mini = number
        Store.maxi = number
    }

} while(true)

