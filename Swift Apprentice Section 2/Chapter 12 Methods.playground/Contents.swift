import UIKit

var str = "Hello, playground"

var numbers = [1, 2, 3]
numbers.removeLast()
print(numbers)

let months = ["January", "February", "March", "April", "May", "June",
              "July", "August", "September", "October", "November", "December"]

struct SimpleDate {
    var month: String
    var day: Int
    
    init(month: String, day: Int) {        // init() {
        self.month = "March"                   // month = "March"
        self.day = 1                           // day = 1
    }                                      // }
    
    func monthsUntilWinterBreak() -> Int {
        months.firstIndex(of: "December")! -
        months.firstIndex(of: month)!
    }
}

let date = SimpleDate(month: "March", day: 1)
date.month
date.monthsUntilWinterBreak()

let valentinesDay = SimpleDate(month: "February", day: 14)
valentinesDay.month
valentinesDay.day

// Mini Exercise
struct SimpleDate1 {
    var month: String
    
    var monthUntilWinterBreak1: Int {
        months.firstIndex(of: "December")! -
        months.firstIndex(of: month)!
    }
}

let date1 = SimpleDate1(month: "October")
date1.monthUntilWinterBreak1

struct SimpleDate2 {
    var month = "January"
    var day = 1
    
    func monthsUntilWinterBreak() -> Int {
        months.firstIndex(of: "December")! -
        months.firstIndex(of: month)!
    }
    
    mutating func advance() {
        day += 1
    }
}

extension SimpleDate2 {
    init(month: Int, day: Int) {
        self.month = months[month - 1]
        self.day = day
    }
}

var newYearsDay2 = SimpleDate2()
newYearsDay2.monthsUntilWinterBreak()
newYearsDay2.month
newYearsDay2.day
newYearsDay2.advance()
newYearsDay2.day

let valentinesDay2 = SimpleDate2(month: "February", day: 14)
valentinesDay2.month
valentinesDay2.day

let octoberFirst2 = SimpleDate2(month: "October")
octoberFirst2.month
octoberFirst2.day

let januaryTwentySecond2 = SimpleDate2(day: 22)
januaryTwentySecond2.month
januaryTwentySecond2.day

struct Math {
    static func factorial(of number: Int) -> Int {
        (1...number).reduce(1, *)
    }
    
    static func triangle(of n: Int) -> Int {        // Mini Exercise
        (1...n).reduce(1, +)
    }
}

Math.factorial(of: 6)
Math.triangle(of: 6)

extension Math {
    static let version = 2.0
    static func primeFactors(of value: Int) -> [Int] {
        
        var remainingValue = value
        
        var testFactor = 2
        var primes: [Int] = []
        
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primes.append(testFactor)
                remainingValue /= testFactor
            }
            else {
                testFactor += 1
            }
        }
        if remainingValue > 1 {
            primes.append(remainingValue)
        }
        return primes
    }
}

Math.primeFactors(of: 81)
Math.version
// MARK: - Challenge 1
struct Circle {
    var radius = 0.0
    var factor = 1.0
    var area: Double {
            .pi * radius * radius * factor
        }

    mutating func grow(byFactor factor: Double) {
        self.factor = factor       // Left side of mutating operator isn't mutable: 'area' is a get-only property
    }
}
var circle1 = Circle(radius: 3)
circle1.area
circle1.grow(byFactor: 3)
circle1.area

struct Circle1 {
    var radius = 0.0
    var area: Double {
        get {
            .pi * radius * radius
        }
        set {
            //newValue = .pi * radius * radius    newValue constant
            radius = (newValue / .pi).squareRoot()
        }
    }
    
    mutating func grow(byFactor factor: Double) {
        area *= factor
    }
}

var circle = Circle1(radius: 3)
circle.area
circle.grow(byFactor: 3)
circle.area

// MARK: - Challenge 2
let months1 = ["January", "February", "March", "April", "May", "June",
               "July", "August", "September", "October", "November", "December"]

struct SimpleDate3 {
    var month: String
    var day: Int
    var totalDaysInMonth: Int {
        switch month {
            case "January", "March", "May", "July", "August", "October", "December":
                return 31
            case "April", "June", "September", "November":
                return 30
            case "Februray":
                return 28
            default:
                return 0
        }
    }

    mutating func advance() {
        if day == totalDaysInMonth {
            if month == "December" {
                month = months1[0]
            } else {
                month = months1[months1.firstIndex(of: month)!.advanced(by: 1)]
            }
            day = 1
        } else {
            day += 1
        }
    }
}

var date3 = SimpleDate3(month: "December", day: 31)
date3.advance()
date3.month
date3.day

// MARK: - Challenge 3
extension Math {
    static func isEven(for number: Int) -> Bool {
        number % 2 == 0
    }
    static func isOdd(for number: Int) -> Bool {
        number % 2 != 0
    }
}

//Math.isEven(for: 25)
//Math.isEven(for: 22)
Math.isOdd(for: 33)
Math.isOdd(for: 36)
Math.isEven(for: 25)
Math.isEven(for: 22)

// MARK: - Challenge 4
extension Int {
    var isEven: Bool {
        self % 2 == 0
    }
    func isOdd() -> Bool {
        !self.isEven
    }
}

2.isEven
5.isEven
7.isOdd()
8.isOdd()

// MARK: - Challenge 5
extension Int {
    func primeFactors() -> [Int] {
        
        var remainingValue = self
        
        var testFactor = 2
        var primes: [Int] = []
        
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primes.append(testFactor)
                remainingValue /= testFactor
            }
            else {
                testFactor += 1
            }
        }
        if remainingValue > 1 {
            primes.append(remainingValue)
        }
        return primes
    }
}

81.primeFactors()
125.primeFactors()
144.primeFactors()
666.primeFactors()
