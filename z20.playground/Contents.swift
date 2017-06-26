enum ArrayError: Error {
    case indexOutOfRange
}

enum ItemError: Error {
    case zeroQuantity
}

protocol Discountable {
    func getDiscountAmount() -> Double
}

class Item: Discountable {
    let name: String
    var quantity: Int
    let price: Double
    private var total: Double {
        get {
            return price * Double(quantity)
        }
    }
    var totalAmount: Double {
        switch quantity {
        case 5 ... 10:
            return total - (total * 0.05)
        case 10 ... 20:
            return total - (total * 0.1)
        case 20 ..< Int.max:
            return total - (total * 0.15)
        default: return total
            
        }
    }
    
    init(name: String, price: Double, quantity: Int) throws {
        guard quantity > 0 else {
            throw ItemError.zeroQuantity
        }
        
        self.name = name
        self.price = price
        self.quantity = quantity
    }
    
    //MARK:- Discountable
    func getDiscountAmount() -> Double {
        return total - totalAmount
    }
}

extension Item: Equatable {
    static func ==(lhs: Item, rhs: Item) -> Bool {
        if lhs === rhs {
            return true
        } else {
            return lhs.name == rhs.name && lhs.price == rhs.price
        }
    }
}

class Order {
    var items = [Item]()
    var totalItemsCount: Int {
        get {
            var total = 0
            
            for item in items {
                total += item.quantity
            }
            
            return total
        }
    }
    private var discount: Double {
        var discount = 0.0
        
        for item in items {
            discount += item.getDiscountAmount()
        }
        
        return discount
    }
    var totalAmount: Double {
        var total = 0.0
        
        for item in items {
            total += item.totalAmount
        }
        
        return total
    }
    
    init() {}
    init(items: [Item]) {
        for item in items {
            addItem(item)
        }
    }
    
    func addItem(_ item: Item) {
        if let index = items.index(of: item) {
            items[index].quantity += item.quantity
        } else {
            items.append(item)
        }
    }
    
    func removeItem(at index: Int) throws {
        guard items.indices.contains(index) else {
            throw ArrayError.indexOutOfRange
        }
        
        items.remove(at: index)
    }
    
    func showOrder() {
        var output = ""
        
        for item in items {
            output += "\(item.name) (\(item.quantity) piece(s)) total: $\(item.totalAmount) ($\(item.getDiscountAmount()) discount included);\n"
        }
        
        output += "Total: $\(totalAmount). You save: $\(discount)"
        
        print(output)
    }
}

let item1 = try! Item(name: "iPhone 7", price: 649, quantity: 1)
let item2 = try! Item(name: "iPhone 7", price: 649, quantity: 1)
let item3 = try! Item(name: "Macbook Pro 13-inch", price: 1299, quantity: 5)
let item4 = try! Item(name: "Apple Watch Series 2", price: 269, quantity: 1)

let order1 = Order()
order1.addItem(item1)
order1.addItem(item2)
order1.addItem(item3)
order1.addItem(item4)
order1.showOrder()

print()

let f1 = try! Item(name: "Apple", price: 0.53, quantity: 10)
let f2 = f1
let f3 = try! Item(name: "Watermelon", price: 2.57, quantity: 4)
let f4 = try! Item(name: "Banana", price: 1.48, quantity: Int.max) //discount not included

let fruits = [f1, f2, f3, f4]
let order2 = Order(items: fruits)
try! order2.removeItem(at: 1)
order2.showOrder()
