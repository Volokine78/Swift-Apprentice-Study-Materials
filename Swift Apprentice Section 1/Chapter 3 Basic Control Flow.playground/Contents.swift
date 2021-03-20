import UIKit

var str = "Hello, playground"

let yes: Bool = true
let no: Bool = false
let doesOneEqualTwo = (1 == 2)
let doesOneNotEqualTwo = (1 != 2)
let alsoTrue = !(1 == 2)
let oneIsGreaterThanTwo = (1 > 2)
let IsOneLessThanTwo = (1 < 2)
let and = true && true
let or = true || false
let andTrue = 1 < 2 && 4 > 3
let andFalse = 1 < 2 && 3 > 4
let orTrue = 1 < 2 || 3 > 4
let orFalse = 1 == 2 || 3 == 4
let andOr = (1 < 2 && 3 > 4) || 1 < 4
let guess = "dog"
let dogEqualsCat = guess == "cat"
let order = "cat" < "dog"
var switchState = true
switchState.toggle()
switchState.toggle()

// mini exercise
let myAge = 30
let isTeenager = myAge >= 13 && myAge <= 19
let theirAge = 30
let bothTeenagers = theirAge >= 13 && theirAge <= 13 && isTeenager

let reader = "Tolga Pirtürk"
let author = "Matt Galloway"
let authorIsReader = reader == author
let readerBeforeAuthor = reader < author

if 2 > 1 {
    print("yes 2 is greater than 1")
}

let animal = "Fox"
if animal == "cat" || animal == "dog" {
    print("animal is a house pet")
} else {
    print("animal is not a house pet")
}

let hourOfDay = 12
var timeOfDay = ""

if hourOfDay < 6 {
    timeOfDay = "Early morning"
} else if hourOfDay < 12 {
    timeOfDay = "Morning"
} else if hourOfDay < 17 {
    timeOfDay = "Afternoon"
} else if hourOfDay < 20 {
    timeOfDay = "Evening"
} else if hourOfDay < 24 {
    timeOfDay = "Late evening"
} else {
    timeOfDay = "INVALID HOUR"
}
print(timeOfDay)

var hoursWorked = 45

var price = 0
if hoursWorked > 40 {
    let hoursOver40 = hoursWorked - 40
    price += hoursOver40 * 50
    hoursWorked -= hoursOver40
}
price += hoursWorked * 25
print(price)

let a = 5
let b = 10

let min: Int
if a < b {
    min = a
} else {
    min = b
}
let max: Int
if a > b {
    max = a
} else {
    max = b
}
print(min)
print(max)

let c = 5
let d = 10

let mini = c < d ? c : d
let maxi = c > d ? c : d

// mini exercise
let myNewAge = 30
if myNewAge > 13 && myNewAge < 19 {
    print("Teenager")
} else {
    print("Not a teenager")
}
let answer = myNewAge > 13 && myNewAge < 19 ? "Teenager" : "Not a teenager"
print(answer)

var sum = 1
while sum < 1000 {
    sum = sum + (sum + 1)
}

var sam = 1
repeat {
    sam = sam + (sam + 1)
} while sam < 1000

var sem = 1
while true {
    sem = sem + (sem + 1)
    if sem >= 1000{
        break
    }
}

// mini exercise
var counter = 0
while counter < 10 {
    print("counter is \(counter)")
    counter += 1
}

var counter1 = 0
var roll = 0
repeat {
    roll = Int.random(in: 0...5)
    counter1 += 1
    print("After \(counter1) roll(s), roll is \(roll)")
} while roll != 0

// MARK: - challenge 1
// lastName is inside if scope so you can not use outside of it
let firstName = "Matt"
let lastName: String

if firstName == "Matt" {
  lastName = "Galloway"
} else if firstName == "Ray" {
  lastName = "Wenderlich"
} else {
  lastName = "Pirtürk"
}

let fullName = firstName + " " + lastName

// MARK: - challenge 2
let answer1 = true && true
let answer2 = false || false
let answer3 = (true && 1 != 2) || (4 > 3 && 100 < 1)
let answer4 = ((10 / 2) > 3) && ((10 % 2) == 0)

// MARK: - challenge 3
let currentPosition = 6
let diceRoll = 6
var nextPosition = currentPosition + diceRoll

if nextPosition == 3 {
    nextPosition = 15
} else if nextPosition == 7 {
    nextPosition = 12
} else if nextPosition == 11 {
    nextPosition = 2
} else if nextPosition == 17 {
    nextPosition = 9
}
print("Final position: \(nextPosition)")

// MARK: - challenge 4
let month = "February"
let year = 2021

var days = 0
if month == "January" || month == "march" || month == "may" || month == "july" || month == "august" ||
    month == "October" || month == "December" {
    days = 31
} else if month == "April" || month == "June" || month == "September" || month == "November" {
    days = 30
} else if month == "February" {
    if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 {
        days = 29
    } else {
        days = 28
    }
}
if days > 0 {
    print("\(month) has \(days) days")
} else {
    print("invalid month")
}

// MARK: - challenge 5
let number = 468
var powerNum = 1
var power = 0

while number >= powerNum {
    powerNum = powerNum * 2
    power += 1
}
print("Next power of 2 after \(number) is \(powerNum) which is 2 to the power of \(power)")

// MARK: - challenge 6
let depth = 6
var count = 1
var triangularNumber = 0

while count <= depth {
    triangularNumber += count
    count += 1
}
print("Triangular Number with depth \(depth) is \(triangularNumber)")

// MARK: - challenge 7
let n = 7
var current = 1
var previous = 1
var done = 2
while done < n {
    let next = current + previous
    previous = current
    current = next
    done += 1
}
print("Fibonacci Number of \(n) is \(current)")

// MARK: - challenge 8
let factor = 6

var i = 0
var accumulator = 0
while i <= 12 {
    print("\(factor) x \(i) = \(accumulator)")
    accumulator += 6
    i += 1
}

// MARK: - challenge 9
var target = 2

while target <= 12 {
    var combinationsFound = 0
    var valueOfFirstDice = 1
    while valueOfFirstDice <= 6 {
        var valueOfSecondDice = 1
        while valueOfSecondDice <= 6 {
            if valueOfFirstDice + valueOfSecondDice == target {
                combinationsFound += 1
            }
            valueOfSecondDice += 1
        }
        valueOfFirstDice += 1
    }
    print("\(target):\t\(combinationsFound)")
    target += 1
}
