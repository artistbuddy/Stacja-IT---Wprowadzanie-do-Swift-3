enum Sex {
    case male, female, gender
}

class Human {
    let age: Int
    let weight: Double
    let height: Double
    let name: String
    let sex: Sex
    var bmi: Double {
        return weight / (height * height)
    }
    
    init(name: String, age: Int, sex: Sex, weight: Double, height: Double) {
        self.name = name
        self.age = age
        self.sex = sex
        self.weight = weight
        self.height = height
    }
}

let karol = Human(name: "Karol", age: 23, sex: .male, weight: 80.0, height: 176.0)
print(karol.bmi)