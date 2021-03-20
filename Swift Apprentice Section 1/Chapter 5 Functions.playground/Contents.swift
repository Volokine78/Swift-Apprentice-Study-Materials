import UIKit

var str = "Hello, playground"

func printMyName() {
    print("My name is Slim Shady")
}
printMyName()

func printMultipleOfFive(value: Int) {
    print("\(value) * 5 = \(value * 5)")
}
printMultipleOfFive(value: 10)

func printMultipleOf(_ multiplier: Int, and value: Int) {
    print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(4, and: 2)

func printMultipleOf(_ multiplier: Int, _ value: Int = 1) {
  print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(4)
printMultipleOf(4, 2)

func multiply(_ number: Int, by multiplier: Int) -> Int {
    return number * multiplier
}
let result = multiply(4, by: 2) * 2

func multiplyAndDivide(_ number: Int, by factor: Int) -> (product: Int, quotient: Int) {
    return (number * factor, number / factor)
}
let results = multiplyAndDivide(4, by: 2)
let product = results.product
let quotient = results.quotient

func multiply1(_ number: Int, by multiplier: Int) -> Int {
    number * multiplier
}

func multipyAndDivide(_ number: Int, by factor: Int) -> (product: Int, quotient: Int) {
    (number * factor, number / factor)
}

var value = 5
func incrementAndPrint(_ value: inout Int) {
    value += 1
    print(value)
}
print(value)
incrementAndPrint(&value)
print(value)

func getValue() -> Int {
    31
}
func getValue() -> String {
    "Matt Galloway"
}

let valueInt: Int = getValue()
let valueString: String = getValue()

// mini exercise
func printFullName(_ firstName: String, _ lastName: String) {
    print("\(firstName) \(lastName)")
}
printFullName("Tolga", "Pirtürk")

func calculateFullName(_ firstName: String, _ lastName: String) -> String {
    firstName + " " + lastName
}
let fullName = calculateFullName("Tolga", "Pirtürk")

func calculateFullNameWithLength(_ firstName: String, _ lastName: String) -> (name: String, length: Int) {
    return (firstName + " " + lastName, firstName.count + lastName.count)
}
let fullNameAndLength = calculateFullNameWithLength("Tolga", "Pirtürk")
let name = fullNameAndLength.name
let length = fullNameAndLength.length
print(name + " " + "\(length)")

/// Calculates the sum of two values
/// - Parameters:
///   - a: The first value
///   - b: The second value
/// - Returns: The sum of the two values
func add(_ a: Int, _ b: Int) -> Int {
    a + b
}
var function = add
function(4, 2)
var function2 = add
function2(8, 5)

func subtract(_ a: Int, _ b: Int) -> Int {
    a - b
}
function = subtract
function(4, 2)

func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = function(a, b)
    print(result)
}
printResult(add, 4, 2)
print(printResult(subtract, 4, 2))

func infiniteLoop() -> Never {
    while true {
    }
}

/// Calculates the average of three values
/// - Parameters:
///     - a: The first value.
///     - b: The second value.
///     - c: The third value.
/// - Returns: The average of the three values.
func calculateAverage(of a: Double, and b: Double, and c: Double) -> Double {
    let total = a + b + c
    let average = total / 3
    return average
}
calculateAverage(of: 1, and: 3, and: 5)

// MARK: - Challenge 1
for index in stride(from: 10.0, through: 9.0, by: -0.1) {
    print(index)
}

// MARK: - Challenge 2
func isNumberDivisible(_ number: Int, by divisor: Int) -> Bool {
    number % divisor == 0
}

func isPrime(_ number: Int) -> Bool {
    if number < 0 {
        return false
    }
    if number <= 3 {
        return true
    }
    let doubleNumber = Double(number)
    let root = Int(doubleNumber.squareRoot())
    for divisor in 2...root {
        if isNumberDivisible(number, by: divisor) {
            return false
        }
    }
    return true
}
isPrime(6)
isPrime(13)
isPrime(8893)
isPrime(-29)

// MARK: - Challenge 3
func fibonacci(_ number: Int) -> Int {
    if number <= 0 {
        return 0
    }
    if number == 1 || number == 2 {
        return 1
    }
    return fibonacci(number - 1) + fibonacci(number - 2)
}
//fibonacci(1)
//fibonacci(2)
//fibonacci(3)
//fibonacci(4)
//fibonacci(5)
fibonacci(10)
fibonacci(20)

