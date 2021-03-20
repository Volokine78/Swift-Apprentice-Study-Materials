import UIKit
import Foundation

var str = "Hello, playground"

let months = ["January", "Febrauary", "March", "April", "May", "June",
              "July", "August", "September", "October", "November", "December"]

func semester(for month: String) -> String {
    switch month {
        case "August", "September", "October", "November":
            return "Autumn"
        case "January", "February", "March", "April", "May":
            return "Spring"
        default:
            return "Not in the school year."
    }
}

semester(for: "April")

enum Month1 {
    case january
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
}

enum Month {
    case january, february, march, april, may, june,
         july, august, september, october, november, december
    
    // Minik Exercise
    var semester: String {
        switch self {
            case .august, .september, .october,
                 .november, .december:
                return "Autumn"
            case .january, .february, .march,
                 .april, .may:
                return "Spring"
            case .june, .july:
                return "Summer"
        }
    }
}

var month = Month.june
let semester = month.semester

func semester1(for month: Month) -> String {
    switch month {
        case Month.august, Month.september, Month.october,
             Month.november, Month.december:
            return "Autumn"
        case Month.january, Month.february, Month.march,
             Month.april, Month.may:
            return "Spring"
        default:
            return "Not in the school year."
    }
}

func semester2(for month: Month) -> String {
    switch month {
        case .august, .september, .october,
             .november, .december:
            return "Autumn"
        case .january, .february, .march,
             .april, .may:
            return "Spring"
        case .june, .july:
            return "Summer"
    }
}

var month1 = Month.april
semester2(for: month1)
month1 = .september
semester2(for: month1)

enum Month2: Int {
    case january = 1, february = 2, march = 3, april = 4, may = 5,
         june = 6, july = 7, august = 8, september = 9, october = 10,
         november = 11, december = 12
}

enum Month3: Int {
    case january = 1, february, march, april, may,
         june, july, august, september, october,
         november, december
    
    // Minik Exercise
    var monthsUntilWinterbreak: Int {
        Month3.december.rawValue - rawValue  //self.rawValue
    }
}

let fifthMonth = Month3(rawValue: 5)!
let monthsLeft = fifthMonth.monthsUntilWinterbreak

func monthsUntilWinterBreak(from month: Month3) -> Int {
    Month3.december.rawValue - month.rawValue
}
monthsUntilWinterBreak(from: .april)

monthsUntilWinterBreak(from: fifthMonth)

enum Icon: String {
    case music
    case sports
    case weather

    var filename: String {
        "\(rawValue).png"
    }
}

let icon = Icon.weather
icon.filename

enum Coin2: Int {
    case penny = 1
    case nickel = 5
    case dime = 10
    case quarter = 25
}

let coin = Coin2.quarter
coin.rawValue

// Minik Exercise
let coinPurse2: [Coin2] = [.penny, .nickel, .dime, .quarter]

var balance = 100

enum WithdrawalResult {
    case success(newBalance: Int)
    case error(message: String)
}

func withdraw(amount: Int) -> WithdrawalResult {
    if amount <= balance {
        balance -= amount
        return .success(newBalance: balance)
    } else {
        return.error(message: "Not enough money!")
    }
}

let result = withdraw(amount: 99)

switch result {
    case .success(let newBalance):
        print("Your new balance is: \(newBalance)")
    case .error(let message):
        print(message)
}

enum HTTPMethod {
    case get
    case post(body: String)
}

let request = HTTPMethod.post(body: "Hi there")
guard case .post(let body) = request else {
    fatalError("No message was posted")
}
print(body)

enum TrafficLight {
    case red, yellow, green
}
let trafficLight = TrafficLight.red

// Minik Exrcise
enum Light {
    case on
    case off
}

var light = Light.on
light = .off

enum Pet: CaseIterable {
    case cat, dog, bird, turtle, fish, hamster, aytek
}

for pet in Pet.allCases {
    print(pet)
}

enum Math {
    // Minik Exercise
    static let e = 2.7183       // Enums must not contain stored properties
    
    static func factorial(of number: Int) -> Int {
        (1...number).reduce(1, *)
    }
}
let factorial = Math.factorial(of: 6)
//let math = Math()

let nestEgg = 25000 * pow(Math.e, 0.07 * 20)
let nestEgg2 = 25000 * pow(M_E, 0.07 * 20)

var age: Int?
age = 17
age = nil

switch age {
    case .none:
        print("No value")
    case .some(let value):
        print("Got a value: \(value)")
}

let optionalNil: Int? = .none
optionalNil == nil
optionalNil == .none

// MARK: - Challenge 1

enum Coin: Int, CaseIterable {
    case penny = 1
    case nickel = 5
    case dime = 10
    case quarter = 25
}

let coinPurse: [Coin] = [.penny, .quarter, .nickel, .dime,
                         .penny, .dime, .quarter]
func totalCents(for purse: [Coin]) -> Int {
    var totalCents = 0
    for coin in purse {
        totalCents += coin.rawValue
    }
    return totalCents
}
let cents = totalCents(for: coinPurse)

func totalCentsFunctional(for purse: [Coin]) -> Int {
    return purse.reduce(0) { $0 + $1.rawValue }
}

// MARK: - Challenge 2
enum Month4: Int {
    case january = 1, february, march, april, may,
         june, july, august, september, october,
         november, december
    
    var numberOfMonthsUntilSummer: Int {
        var monthsLeft = 0
        if rawValue > 6 {
            monthsLeft = Month4.june.rawValue + 12 - rawValue
        } else {
            monthsLeft = Month4.june.rawValue - rawValue
        }
        return monthsLeft
    }
}
let october = Month4.october
october.numberOfMonthsUntilSummer

enum Month5: Int {
    case january = 1, february, march, april, may,
         june, july, august, september, october,
         november, december
    
    var monthsUntilSummer: Int {
        var monthsLeft = Month5.june.rawValue - self.rawValue
        if monthsLeft < 0 {
            monthsLeft += 12
        }
        return monthsLeft
    }
    
    var monthsUntilSummerTek: Int {
        return Self.june.rawValue - rawValue + (rawValue > 6 ? 12 : 0)
    }
}
let month3 = Month5.november
month3.monthsUntilSummer
let month4 = Month5.november
month4.monthsUntilSummerTek

// MARK: - Challenge 3
enum Direction: Int {
    case north
    case south
    case east
    case west
}

let movements: [Direction] = [.north, .north, .west, .south, .west, .south,
                              .south, .east, .east, .south, .east]

func lastLocation(for: [Direction]) -> (x: Int, y: Int) {
    var location = (x: 0, y: 0)
    
    for movement in movements {
        switch movement {
            case .north:
                location.y += 1
            case .south:
                location.y -= 1
            case .west:
                location.x += 1
            case .east:
                location.x -= 1
        }
    }
    return location
}

let player = lastLocation(for: movements)
