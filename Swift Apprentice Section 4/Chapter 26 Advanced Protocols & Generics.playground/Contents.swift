import UIKit

var str = "Hello, playground"

protocol Pet {
    //associatedtype Food
    var name: String { get }
}

struct Cat: Pet {
    var name: String
}

var somePet: Pet = Cat(name: "Minik")

protocol WeightCalculatable {
    associatedtype WeightType: Numeric
    var weight: WeightType { get }
}

extension WeightCalculatable {
    static func + (left: Self, right: Self) -> WeightType {
        left.weight + right.weight
    }
}

class Truck: WeightCalculatable {
    typealias WeightType = Int
    
    var weight: Int {
        100
    }
}

class Flower: WeightCalculatable {
    typealias WeightType = Double
    
    var weight: Double {
        0.0025
    }
}

var heavyTruck1 = Truck()
var heavyTruck2 = Truck()
heavyTruck1 + heavyTruck2

var lightFlower1 = Flower()
//heavyTruck1 + lightFlower1

//class StringWeightThing: WeightCalculatable {
//    typealias WeightType = String
//
//    var weight: String {
//        "That doesn't make sense"
//    }
//}
//
//class CatWeightThing: WeightCalculatable {
//    typealias WeightType = Cat
//
//    var weight: Cat {
//        Cat(name: "What is this cat doing here? MiloTheFirstPurr: I will kill you, Viva la revolucion!")
//    }
//}

protocol Product {}

protocol ProductionLine {
    func produce() -> Product
}

protocol Factory {
    var productionLines: [ProductionLine] { get }
}

extension Factory {
    func produce() -> [Product] {
        var items: [Product] = []
        productionLines.forEach { items.append($0.produce()) }
        print("Finished Production")
        print("-------------------")
        return items
    }
}

struct Car: Product {
    init() {
        print("Producing one awesome car 🚔")
    }
}

struct CarProductionLine: ProductionLine {
    func produce() -> Product {
        Car()
    }
}

struct CarFactory: Factory {
    var productionLines: [ProductionLine] = []
}

var carFactory = CarFactory()
carFactory.productionLines = [CarProductionLine(), CarProductionLine()]
carFactory.produce()

struct Chocolate: Product {
    init() {
        print("Producing one chocolate bar 🍫")
    }
}

struct ChocolateProductionLine: ProductionLine {
    func produce() -> Product {
        Chocolate()
    }
}

//struct ChocolateFactory: Factory {
//    var productionLines: [ProductionLine] = []
//}

var oddCarFactory = CarFactory()
oddCarFactory.productionLines = [CarProductionLine(), ChocolateProductionLine()]
oddCarFactory.produce()

protocol Product1 {
    init()
}

protocol ProductionLine1 {
    associatedtype ProductType
    func produce() -> ProductType
}

protocol Factory1 {
    associatedtype ProductType
    func produce() -> [ProductType]
}

struct Car1: Product1 {
    init() {
        print("Producing one Car 🚔")
    }
}

struct Chocolate1: Product1 {
    init() {
        print("Producing one Chocolate bar 🍫")
    }
}

struct GenericProductionLine<P: Product1>: ProductionLine1 {
    func produce() -> P {
        P()
    }
}

struct GenericFactory<P: Product1>: Factory1 {
    var productionLines: [GenericProductionLine<P>] = []
    
    func produce() -> [P] {
        var newItems: [P] = []
        productionLines.forEach { newItems.append($0.produce()) }
        print("Finished New Production")
        print("-----------------------")
        return newItems
    }
}

var carFactory1 = GenericFactory<Car1>()
carFactory1.productionLines = [GenericProductionLine<Car1>(), GenericProductionLine<Car1>()]
carFactory1.produce()

// Minik Exercise

protocol Product2 {
    init()
}

protocol ProductionLine2 {
    associatedtype ProductType
    func produce() -> ProductType
}

protocol Factory2 {
    associatedtype ProductType
    var warehouse: [ProductType] { get }
    func produce()
    func addProductionLine()
}

struct Car2: Product2 {
    init() {
        print("Producing one Car 🚔")
    }
}

struct Chocolate2: Product2 {
    init() {
        print("Producing one Chocolate bar 🍫")
    }
}

struct GenericProductionLine2<P: Product2>: ProductionLine2 {
    func produce() -> P {
        P()
    }
}

class GenericFactory2<P: Product2>: Factory2 {

    var productionLines: [GenericProductionLine2<P>] = []
    var warehouse: [P] = []
    
    func produce() {
        var newItems: [P] = []
        productionLines.forEach { newItems.append($0.produce()) }
        print("Finished New Production")
        print("-----------------------")
        warehouse.append(contentsOf: newItems)
    }
    
    func addProductionLine() {
        productionLines.append(GenericProductionLine2<P>())
    }
}

let chocolateFactory = GenericFactory2<Chocolate2>()
chocolateFactory.addProductionLine()
chocolateFactory.produce()
chocolateFactory.warehouse.count
chocolateFactory.addProductionLine()
chocolateFactory.produce()
chocolateFactory.warehouse.count

// End of Minik Exercise

let array = Array(1...10)
let set = Set(1...10)
let reversedArray = array.reversed()

for e in reversedArray {
    print(e)
}

let arrayCollections = [array, Array(set), Array(reversedArray)]
let collections = [AnyCollection(array),
                   AnyCollection(set),
                   AnyCollection(array.reversed())]
let total = collections.flatMap { $0 }.reduce(0, +)
print(total)

func makeValue() -> some FixedWidthInteger {
    42
}

print("Two makeValues summed", makeValue() + makeValue())

func makeValueRandomly() -> some FixedWidthInteger {
    if Bool.random() {
        return Int(42)
    }
    else {
        return Int(24)
    }
}

//let v: FixedWidthInteger = 42
let v = makeValue()

func makeEquatableNumericInt() -> some Numeric & Equatable & Comparable { 1 }
func makeEquatableNumericDouble() -> some Numeric & Equatable { 1.0 }

let value1 = makeEquatableNumericInt()
let value2 = makeEquatableNumericInt()

print(value1 == value2)
print(value1 + value2)
print(value1 > value2)

// MARK: - Challenge 1, 2, 3, 4

protocol VehicleToy {
    static var numberOfPieces: Int { get }
    init()
}

extension VehicleToy {
    var price: Int { Self.numberOfPieces * 5 }
}

protocol Robot {
    associatedtype ToyType where ToyType: VehicleToy
    var piecesPerMinute: Int { get }
}

extension Robot {
    func assemble(durationInMinutes : Int) -> [ToyType] {
        let numberOfToys = (durationInMinutes * piecesPerMinute) / ToyType.numberOfPieces
        return assemble(newOrders: numberOfToys).1
    }
    
    func assemble(newOrders: Int) -> (Int, [ToyType]) {
        let totalPieces = newOrders * ToyType.numberOfPieces
        let assembleTime = totalPieces / piecesPerMinute
        
        var newToys: [ToyType] = []
        for _ in 0 ..< newOrders {
            newToys.append(ToyType())
        }
        
        return (assembleTime, newToys)
    }
}

struct ToyTrain: VehicleToy {
    static var numberOfPieces: Int = 75
}

struct TrainRobot: Robot {
    typealias ToyType = ToyTrain
    var piecesPerMinute: Int = 500
}

func constructToyRobot() -> some Robot {
    TrainRobot()
}

struct MonsterTruckToy: VehicleToy {
    static var numberOfPieces: Int = 120
}

struct MonsterTruckRobot: Robot {
    typealias ToyType = MonsterTruckToy
    var piecesPerMinute: Int = 200
}

func constructNewToyRobot() -> some Robot {
    MonsterTruckRobot()
}

class Shop {
    var displayList: [VehicleToy] = []
    var warehouseList: [VehicleToy] = []
    let displaySize = 100
    
    private func fillDisplay() {
        if displayList.count < displaySize {
            var difference = displaySize - displayList.count
            if difference > warehouseList.count {
                difference = warehouseList.count
            }
            
            let itemsToAdd = warehouseList[0 ..< difference]
            displayList.append(contentsOf: itemsToAdd)
            warehouseList.removeFirst(difference)
        }
    }
    
    private func sellToys(count: Int) -> Int {
        let actualSales = count > displayList.count ? displayList.count : count
        displayList.removeFirst(actualSales)
        
        return actualSales
    }
    
    func startDay(numberOfVisitors: Int) {
        
        fillDisplay()
        
        let potentialSales = Double(numberOfVisitors) * 1.5
        let actualSales = sellToys(count: Int(potentialSales))
        
        print("Potential sales today were: \(potentialSales)")
        print("Actual sales today were: \(actualSales)")

        print("Current warehouse has \(warehouseList.count) items")
        print("Current display has \(displayList.count) items")
        
        if warehouseList.count < displaySize {
          let itemsToConstruct = (displaySize * 2) - warehouseList.count
          let robot = constructToyRobot()
          let (operationalDuration, newToys) = robot.assemble(newOrders: itemsToConstruct)

          warehouseList.append(contentsOf: newToys)

          print("Robot was rented today and operated for: \(operationalDuration) minutes")
        }else {
          print("Robot was not needed today")
        }

        print("-------- End of Day --------")
    }
}

let shop = Shop()

shop.startDay(numberOfVisitors: 50)
shop.startDay(numberOfVisitors: 100)
shop.startDay(numberOfVisitors: 10)
shop.startDay(numberOfVisitors: 5)
