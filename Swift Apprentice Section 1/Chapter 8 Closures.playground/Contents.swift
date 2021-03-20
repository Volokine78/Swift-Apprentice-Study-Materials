import UIKit

var str = "Hello, playground"

var multiplyClosure2: (Int, Int) -> Int
var multiplyClosure = { (a: Int, b: Int) -> Int in
    return a * b
}
let result = multiplyClosure(4, 2)

multiplyClosure = { (a: Int, b: Int) -> Int in
    a * b
}
multiplyClosure = { (a, b) in
    a * b
}
multiplyClosure = {
    $0 * $1
}
print(multiplyClosure(8, 5))

func operateOnNumbers(_ a: Int, _ b: Int,
                      operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    print(result)
    return result
}

let addClosure = { (a: Int, b: Int) in
    a + b
}
operateOnNumbers(4, 2, operation: addClosure)

func addFunction(_ a: Int, _ b: Int) -> Int {
    a + b
}
operateOnNumbers(5, 12, operation: addFunction)

operateOnNumbers(4, 6, operation: { (a: Int, b: Int) -> Int in
    return a + b
})

operateOnNumbers(89, 6, operation: { $0 + $1 }) // 2 times ??
operateOnNumbers(4, 6, operation: +)
operateOnNumbers(4, 6) {                        // Trailing closure syntax
    $0 + $1
}

func sequenced(first: () -> Void, second: () -> Void) {
    first()
    second()
}
sequenced {
    print("Hello, ", terminator: "")
} second: {
    print("world.")
}

let voidClosure: (Int) -> Void = {
    print("Swift Apprentice is \($0) awesome!")
}
voidClosure(5)

var counter = 0
let incrementCounter = {
    counter += 1
}
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()
print(counter)

func countingClosure() -> () -> Int {
    var counter = 0
    let incrementCounter: () -> Int = {
        counter += 1
        return counter
    }
    return incrementCounter
}
let counter1 = countingClosure()
let counter2 = countingClosure()

counter1()
counter2()
counter1()
counter1()
counter2()

let names = ["ZZZZZZ", "BB", "A", "CCCC", "EEEEE"]
print(names.sorted())

print(names.sorted {
    $0.count > $1.count
})

let values = [1, 2, 3, 4, 5, 6]
values.forEach {
    print("\($0): \($0*$0)")
}

var prices = [1.5, 10, 4.99, 2.30, 8.19]
let largePrices = prices.filter {
    $0 > 5
}
print(largePrices)

let largePrice = prices.first {
    $0 > 5
}
print(largePrice as Any)

let salePrices = prices.map {
    $0 * 0.9
}
print(salePrices)

let userInput = ["0", "11", "haha", "42"]
let numbers1 = userInput.map {
    Int($0)
}
print(numbers1)

let numbers2 = userInput.compactMap {
    Int($0)
}
print(numbers2)

let numbers3 = [1, 2, 9, nil, 5]
let numbers3Unwrapped = numbers3.compactMap {
    $0
}

let userInputNested = [["0", "1"], ["a", "b", "c"], ["🐕"]]
let allUserInput = userInputNested.flatMap {                
  $0
}
print(allUserInput)

let sum = allUserInput.reduce("") {
    $0 + $1
}

let sum2 = allUserInput.reduce("", +)

print(sum)
print(sum2)

let stock = [1.5: 5, 10: 2, 4.99: 20, 2.30: 5, 8.19: 30]
let stockSum = stock.reduce(0) {
    $0 + $1.key * Double($1.value)
}
print(stockSum)

let farmAnimals = ["🐎": 5, "🐄": 10, "🐑": 50, "🐶": 1]
let allAnimals = farmAnimals.reduce(into: []) {
  (result, this: (key: String, value: Int)) in
    for _ in 0 ..< this.value {
    result.append(this.key)
  }
}

let allAnimals1 = farmAnimals.reduce(into: []) {
    for _ in 0 ..< $1.value {
        $0.append($1.key)
    }
}

print(allAnimals)
print(allAnimals1)

let removeFirst = prices.dropFirst()
let removeFirstTwo = prices.dropFirst(2)
print(removeFirst)
print(removeFirstTwo)
print(prices)

let removeLast = prices.dropLast()
let removeLastTwo = prices.dropLast(2)

let firstTwo = prices.prefix(2)
let lastTwo = prices.suffix(2)
print(firstTwo)
print(lastTwo)
print(prices)

prices.removeAll() { $0 > 2 }
print(prices)
prices.removeAll()
print(prices)

func isPrime(_ number: Int) -> Bool {
    if number == 1 { return false }
    if number == 2 || number == 3 { return true }
    
    for i in 2...Int(Double(number).squareRoot()) {
        if number % i == 0 { return false }
    }
    return true
}

var primes: [Int] = []
var i = 1
while primes.count < 10 {
    if isPrime(i) {
        primes.append(i)
    }
    i += 1
}
primes.forEach { print($0) }

let primes1 = (1...).lazy
    .filter { isPrime($0) }
    .prefix(10)
primes1.forEach { print($0) }

// Mini Exercise
let catNames = ["Sofi", "Minik", "Oscar", "Rıfkı"]
let stringOfCatNames = catNames.reduce("") {
    $0 + $1
}
print(stringOfCatNames)

let filteredStringOfCatNames = catNames.filter {
    $0.count > 4
} .reduce("") { $0 + $1 }
print(filteredStringOfCatNames)

let namesAndAges = ["Tom": 15, "Jack": 32, "Maggie": 25, "Stephanie": 12]
let filteredNamesAndAges = namesAndAges.filter {
    $0.value < 18
}
print(filteredNamesAndAges)

let filteredAndChoppedNamesAndAges = namesAndAges.filter {
    $0.value >= 18
} .map { $0.key }
print(filteredAndChoppedNamesAndAges)

// MARK: - Challenge 1
func repeatTask(times: Int, task: () -> ()) {
    for _ in 0 ..< times {
        task()
    }
}
repeatTask(times: 10) {
    print("Swift Apprentice is a great book!")
}

// MARK: - Challenge 2
func mathSum(length: Int, series: (Int) -> Int) -> Int {
    var result = 0
    for i in 1 ... length {
        result += series(i)
    }
    return result
}

print(mathSum(length: 10) {
    $0 * $0
})

print(mathSum(length: 10) { number in
    number * number
})

func fibonacci(_ number: Int) -> Int {
    if number <= 0 {
        return 0
    }
    
    if number == 1 || number == 2 {
        return 1
    }
    
    return fibonacci(number - 1) + fibonacci(number - 2)
}

print(mathSum(length: 10, series: fibonacci))

// MARK: - Challenge 3
let appRatings = [
  "Calendar Pro": [1, 5, 5, 4, 2, 1, 5, 4],
  "The Messenger": [5, 4, 2, 5, 4, 1, 1, 2],
  "Socialise": [2, 1, 2, 2, 1, 2, 4, 2]
]

var averageRatings: [String: Double] = [:]
appRatings.forEach {
    let total = $0.value.reduce(0) {
        $0 + $1
    }
    averageRatings[$0.key] = Double(total) / Double($0.value.count)
}

let goodApps = averageRatings.filter {
    $0.value > 3
} .map {
    $0.key
}
print(averageRatings)
print(goodApps)
