import UIKit

var str = "Hello, playground"

var integer: Int = 100
var decimal: Double = 12.5
integer = Int(decimal)

let hourlyRate: Double = 19.5
let hoursWork: Int = 10
let totalCost: Double = hourlyRate * Double(hoursWork)

let typeInferredInt = 42
let typeInferredDouble = 3.14159

let wantADouble = 3
let wantAnInteger = 3.0
let actuallyInteger = Int(3.8)
let actuallyDouble = Double(3)
let actuallyDouble1: Double = 3
let actuallyDouble2 = 3 as Double

// mini exercise
let age1 = 42
let age2 = 21
let avg1 = (Double(age1) + Double(age2)) / 2
let avg2 = (age1 + age2) / 2

let stringDog: String = "Dog"
var message = "Hello" + " my name is "
let name = "Matt "
message += name
let exclamationMark: Character = "!"
message += String(exclamationMark)
message = "Hello my name is \(name)!"

let oneThird = 1.0 / 3.0
let oneThirdLongString = "One Third is \(oneThird) as a decimal"
let bigString = """
     You can have a string
      that contains multiple
       lines
      by
     doing this.
    """
print(bigString)

// mini exercise
let firstName = "Tolga"
let lastName = " Pirtürk"
let fullName = firstName + lastName
let myDetails = "Hello my name is \(fullName)."

let coordinates1: (Int, Int) = (2, 3)
let coordinatesDoubles = (2.1, 3.5)
let coordinatesMixed = (2.1, 3)
let x1 = coordinates1.0
let y1 = coordinates1.1
let coordinatesNamed = (x: 2, y: 3)
let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y
let coordinates3D = (x: 2, y: 3.0, z: 1)
let (x3, y3, z3) = coordinates3D
let (x4, y4, _) = coordinates3D

// mini exercise
let date3 = (6, 20, 1990, 27.5)
var date1: (mounth: Int, day: Int, year: Int, averageTemperature: Double) = date3
var date = (mounth: 6,day: 20,year: 1990,averageTemperature: 27.5)
let (_, d1, _, a1) = date
date = (6, 20, 1990, 30.5)

let a: Int16 = 12
let b: UInt8 = 255
let c: Int32 = -100000
let answer = Int(a) + Int(b) + Int(c) // Int olarak yazınca data kaybı oluyor mu ?

typealias Animal = String
let myPet: Animal = "Cat"
typealias Coordinates = (Int, Int)
let xy: Coordinates = (2, 4)

// MARK: - challenge 1
let coordinates = (2, 3)

// MARK: - challenge 2
let namedCoordinate = (row: 2, column: 3)

// MARK: - challenge 3
let character: Character = "🐶"
let string: String = "Dog"
let string2: String = "🐶"

// MARK: - challenge 4
let tuple = (day: 15, month: 8, year: 2015)
let day1 = tuple.day

// MARK: - challenge 5
var name2 = "Matt"
name2 += " Galloway"

// MARK: - challenge 6
let tuple1 = (100, 1.5, 10)
let value = tuple1.1

// MARK: - challenge 7
let tuple2 = (day: 15, month: 8, year: 2015)
let month = tuple2.month

// MARK: - challenge 8
let number = 10
let multiplier = 5
let summary = "\(number) multiplied by \(multiplier) equals \(number * multiplier)"

// MARK: - challenge 9
let d = 4
let e: Int32 = 100
let f: UInt8 = 12
let solution = d + Int(e) - Int(f)

// MARK: - challenge 10
Double.pi
Float.pi
