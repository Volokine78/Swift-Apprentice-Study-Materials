import UIKit

var str = "Hello, playground"

let restaurantLocation1 = (3, 4)
let restaurantRange1 = 2.5

func distance1(from source: (x: Int, y: Int), to target: (x: Int, y: Int)) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX * distanceX + distanceY * distanceY).squareRoot()
}

func isInDeliveryRange1(location: (x: Int, y: Int)) -> Bool {
    let deliveryDistance = distance(from: location, to: restaurantLocation)
    return deliveryDistance < restaurantRange
}

isInDeliveryRange1(location: (x: 5, y: 5))

let restaurantLocation = (3, 4)
let restaurantRange = 2.5

let otherRestaurantLocation = (7, 8)
let otherRestaurantRange = 1.5

func distance(from source: (x: Int, y: Int), to target: (x: Int, y: Int)) -> Double {
  let distanceX = Double(source.x - target.x)
  let distanceY = Double(source.y - target.y)
  return (distanceX * distanceX + distanceY * distanceY).squareRoot()
}

func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool {
  let deliveryDistance = distance(from: location, to: restaurantLocation)
  
  let secondDeliveryDistance = distance(from: location, to: otherRestaurantLocation)
  
  return deliveryDistance < restaurantRange || secondDeliveryDistance < otherRestaurantRange
}

isInDeliveryRange(location: (x: 5, y: 5))

struct Location {
    let x: Int    // property
    let y: Int    // property
}

let storeLocation = Location(x: 3, y: 4)
print(storeLocation)

struct DeliveryArea {
    let center: Location
    var radius: Double
    func contains(_ location: Location) -> Bool {
        let distanceFromCenter = distance(from: (center.x, center.y),
                                          to: (location.x, location.y))
        return distanceFromCenter < radius
    }
}

let area = DeliveryArea(center: Location(x: 3, y: 4), radius: 2.5)
let customerLocation3 = Location(x: 5, y: 5)
area.contains(customerLocation3)

var storeArea = DeliveryArea(center: storeLocation, radius: 2.5)
print(storeArea)

// Mini Exercise
struct PizzaOrder {
    var toppings: [String] = ["Corn", "Mushroom", "Sausage", "Black Olive", "Bacon"]
    var sizeAndPrice: [String: Int] = ["Small": 3, "Medium": 6, "Large": 8]
    var type: [String] = ["Pepperoni", "Meat", "Margherita"]
}

let pizza = PizzaOrder(toppings: ["Corn", "Mushroom","Bacon"], sizeAndPrice: ["Medium": 6],
                       type: ["Pepperoni"])
print(pizza)
let pizza2 = PizzaOrder()

print(storeArea.radius)
print(storeArea.center.x)

storeArea.radius = 250
print(storeArea.radius)

var fixedArea = DeliveryArea(center: storeLocation, radius: 4)
fixedArea.radius = 250

// Mini Exercise
let areas = [
    DeliveryArea(center: Location(x: 3, y: 4), radius: 2.5),
    DeliveryArea(center: Location(x: 7, y: 8), radius: 1.5)
]

func isIndeliveryRange(_ location: Location) -> Bool {
    for area in areas {
        let distanceToStore = distance(from: (area.center.x, area.center.y),
                                       to: (location.x, location.y))
        
        if distanceToStore < area.radius {
            return true
        }
    }
    return false
}

let customerLocation1 = Location(x: 8, y: 1)
let customerLocation2 = Location(x: 5, y: 5)

print(isIndeliveryRange(customerLocation1))
print(isIndeliveryRange(customerLocation2))

// Mini Exercise
struct Location1 {
    let x: Int    // property
    let y: Int    // property
}

func distance1(from source: Location1, to target: Location1) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return sqrt(distanceX * distanceX + distanceY * distanceY)
}

struct DeliveryArea1: CustomStringConvertible {
    let center: Location1
    var radius: Double
    var description: String {
        """
        Area with center: (x: \(center.x), y: \(center.y)),
        radius: \(radius)
        """
    }
    
    func contains1(_ location: Location1) -> Bool {
        distance1(from: center, to: location) < radius
    }
    
    func overlaps(with area: DeliveryArea1) -> Bool {
        distance1(from: center, to: area.center) <= (radius + area.radius)
    }
}

let area1 = DeliveryArea1(center: Location1(x: 3, y: 4), radius: 2.5)
let area2 = DeliveryArea1(center: Location1(x: 7, y: 8), radius: 2.5)
area1.overlaps(with: area2)

let area3 = DeliveryArea1(center: Location1(x: 3, y: 4), radius: 2.5)
let area4 = DeliveryArea1(center: Location1(x: 7, y: 7), radius: 2.5)
area3.overlaps(with: area4)

var a = 5
var b = a
print(a)
print(b)

a = 10
print(a)
print(b)

var area5 = DeliveryArea1(center: Location1(x: 3, y: 4), radius: 2.5)
var area6 = area5
print(area5.radius)
print(area6.radius)

area5.radius = 4
print(area5.radius)
print(area6.radius)

print(area5)
print(area6)

// MARK: - Challenge 1
struct Fruit: Hashable {
    let kind: String
    let weight: Double
}

let fruitTruck: [Fruit: Double] = [Fruit(kind: "pear", weight: 2): 20,
                                   Fruit(kind: "apple", weight: 1.5): 30,
                                   Fruit(kind: "orange", weight: 2.5): 15]

func fruitList(for truck: [Fruit: Double]) {
    var totalWeight: Double = 0
    
    for fruit in truck {
        let weight = fruit.value * fruit.key.weight
        totalWeight += weight
    }
    print("Total weight of fruits: \(totalWeight) kg", "\n---")
        
    for (index, list) in truck.enumerated() {
        print("\(index + 1). Fruit type: \(list.key.kind), amount: \(list.value)")
    }
}
fruitList(for: fruitTruck)

struct Fruit1 {
    let kind: String
    let weight: Int
}

let truck: [Fruit1] = [
  Fruit1(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit1(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit1(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit1(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit1(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit1(kind: "Apple", weight: Int.random(in: 70...100))
]


var pears = [Fruit1]()
var apples = [Fruit1]()
var oranges = [Fruit1]()

var totalProcessedWeight = 0

func receive(_ truck: [Fruit1]) {
  for fruit in truck {
    switch fruit.kind {
    case "Pear":
      pears.append(fruit)
    case "Apple":
      apples.append(fruit)
    case "Orange":
      oranges.append(fruit)
    default:
      fatalError("Fruit type not supported")
    }
    
    totalProcessedWeight += fruit.weight
  }
}

receive(truck)

print("Total weight:", totalProcessedWeight, "grams", "\n---")
print("Quantity of pears:\t\t", pears.count)
print("Quantity of apples:\t\t", apples.count)
print("Quantity of oranges:\t", oranges.count, "\n")

// MARK: - Challenge 2
typealias Size = String
let small: Size = "Small"
let medium: Size = "Medium"
let large: Size = "Large"
let xLarge: Size = "XLarge"

typealias Material = String
let cotton: Material = "Cotton"
let polyester: Material = "polyester"
let wool: Material = "Wool"

typealias Color = String

struct TShirt {
    let size: Size
    let color: Color
    let material: Material

    func cost() -> Double {
        let basePrice = 10.0
    
        let sizeMultiplier: Double
        switch size {
            case small, medium:
                sizeMultiplier = 1.0
            case large, xLarge:
                sizeMultiplier = 1.1
            default:
            sizeMultiplier = 1.2
        }

        let materialMultipler: Double
        switch material {
            case cotton:
                materialMultipler = 1.0
            case polyester:
                materialMultipler = 1.1
            case wool:
                materialMultipler = 1.5
            default:
            materialMultipler = 2.0
        }
        return basePrice * sizeMultiplier * materialMultipler
    }
}
print(TShirt(size: medium, color: "Green", material: cotton).cost())
print(TShirt(size: xLarge, color: "Grey", material: wool).cost())

// MARK: - Challenge 3
struct Coordinate {
    let x: Int
    let y: Int
}

struct Ship {
    let origin: Coordinate
    let direction: String
    let length: Int
    
    func isHit(coordinate: Coordinate) -> Bool {
        if direction == "Right" {
            return origin.y == coordinate.y &&
                coordinate.x >= origin.x &&
                coordinate.x - origin.x < length
        } else {
            return origin.x == coordinate.x &&
                coordinate.y >= origin.y &&
                coordinate.y - origin.y < length
        }
    }
}

struct Board {
    var ships: [Ship] = []
    
    func fire(location: Coordinate) -> Bool {
        for ship in ships {
            if ship.isHit(coordinate: location) {
                print("--Hit!--\n")
                print(ship, "\n")
                return true
            }
        }
        print("\n--Miss!--\n")
        return false
    }
}

let destroyer = Ship(origin: Coordinate(x: 2, y: 2), direction: "Right", length: 2)
let submarine = Ship(origin: Coordinate(x: 0, y: 0), direction: "Down", length: 3)
let battleship = Ship(origin: Coordinate(x: 5, y: 3), direction: "Down", length: 4)
let carrier = Ship(origin: Coordinate(x: 3, y: 4), direction: "Down", length: 5)
let cruiser = Ship(origin: Coordinate(x: 6, y: 6), direction: "Right", length: 3)

var board = Board()
board.ships.append(contentsOf: [destroyer, battleship, submarine, carrier, cruiser])


board.fire(location: Coordinate(x: 2, y: 2))

board.fire(location: Coordinate(x: 2, y: 3))

board.fire(location: Coordinate(x: 5, y: 6))

board.fire(location: Coordinate(x: 5, y: 7))

