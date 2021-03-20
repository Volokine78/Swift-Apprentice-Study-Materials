import UIKit

var str = "Hello, playground"

// MARK: - Fibonacci
func fibonacci(position: Int) -> Int {
    switch position {
        case let n where n <= 1:
            return 0
        case 2:
            return 1
        case let n:
            return fibonacci(position: n - 1) + fibonacci(position: n - 2)
    }
}
//
//let fib15 = fibonacci(position: 15)
//let fib1 = fibonacci(position: 1)
//let fib2 = fibonacci(position: 2)
//let fib3 = fibonacci(position: 3)

// MARK: - FizzBuzz
//for i in 1...100 {
//    switch (i % 3, i % 5) {
//        case (0, 0):
//            print("FizzBuzz", terminator: " ")
//        case (0, _):
//            print("Fizz", terminator: " ")
//        case (_, 0):
//            print("Buzz", terminator: " ")
//        case (_, _):
//            print(i, terminator: " ")
//    }
//}
//print("")

let matched = (1...10 ~= 5)
if case 1...10 = 5 {
    print("In the range")
}

let list = [0, 1, 2, 3]
let integer = 2

let isInArray = (list ~= integer) //Type of expression is ambiguous without more context
if case list = integer {
    print("The integer is in the array")
} else {
    print("The integer is not in the array")
}
//Expression pattern of type '[Int]' cannot match values of type 'Int'

let isInList = list.contains(integer)
func ~=(pattern: [Int], value: Int) -> Bool {
    for i in pattern {
        if i == value {
            return true
        }
    }
    return false
}

// MARK: - Challenge 1
enum FormField {
    case firstName(String)
    case lastName(String)
    case emailAddress(String)
    case age(Int)
}
let minimumAge = 21
let submittedAge = FormField.age(22)

if case .age(let years) = submittedAge, years > minimumAge {
    print("You're accepted.")
} else {
    print("You're not accepted.")
}

// MARK: - Challenge 2
enum CelestialBody {
    case star
    case planet(liquidWater: Bool)
    case comet
}

let telescopeCensus: [CelestialBody] = [
    .star,
    .planet(liquidWater: false),
    .planet(liquidWater: true),
    .planet(liquidWater: true),
    .comet
]

for planet in telescopeCensus {
    switch planet {
        case .planet(let liquidWater) where liquidWater:
            print("This planet has liquid water.")
        case .planet(let liquidWater) where !liquidWater:
            print("This planet has no liquid water.")
        case .star:
            print("This is a star so no water.")
        case .comet:
            print("This is a comet.")
        default:
            break
    }
}

for case .planet(let water) in telescopeCensus where water {
    print("Found a potentially habitatible planet")
}

// MARK: - Challenge 3
let queenAlbums = [
    ("A Night at the Opera", 1974),
    ("Sheer Heart Attack", 1974),
    ("Jazz", 1978),
    ("The Game", 1980)
]

for case (let album, 1974) in queenAlbums {
    print("Found the album: \(album) that released in 1974")
}

// MARK: - Challenge 4
let coordinates = (lat: 37.334890, long: -122.009000)

switch coordinates {
    case (let lat, _) where lat < 0:
        print("In the southern hemisphere.")
    case (let lat, _) where lat == 0:
        print("It's on the equator.")
    case (let lat, _) where lat > 0:
        print("In the northern hemisphere.")
    default:
        break
}
