import UIKit

var str = "Hello, playground"

let closedRange = 0...5
let halfOpenRange = 0..<5

while Int.random(in: 1...6) != 6 {
    print("Not a six")
}

let count = 10
var sum = 0
for i in 1...count {
    sum += i
}
print("\(sum)")

sum = 1
var lastsum = 0

for _ in 0..<count {
    let temp = sum
    sum = sum + lastsum
    lastsum = temp
}
lastsum

sum = 0
for i in 1...count where i % 2 == 1 {
    sum += i
}
sum

sum = 0

for row in 0..<8 {
    if row % 2 == 0 {
        continue
    }
    
    for column in 0..<8 {
        sum += row * column
    }
}
sum

sum = 0

rowLoop: for row in 0..<8 {
    columnLoop: for column in 0..<8 {
        if row == column {
            continue rowLoop
        }
        sum += row * column
    }
}
sum
 // mini exercise
let range = 1...10
for i in range {
    let square = i * i
    print("\(square)")
}

for i in range {
    let squareRoot = sqrt(Double(i))
    print("\(squareRoot)")
}

sum = 0

for row in 0..<8 where row % 2 != 0 {
    for column in 0..<8 {
        sum += row * column
    }
}
sum

let number = 10

switch number {
case 0:
    print("Zero")
default:
    print("Non-zero")
}

switch number {
case 10:
    print("It's ten!")
default:
    break
}

let string = "Dog"

switch string {
case "Cat", "Dog":
    print("Animal is a house pet.")
default:
    print("Animal is not a house pet.")
}

let hourOfDay = 12
var timeOfDay = ""

switch hourOfDay {
case 0, 1, 2, 3, 4, 5:
    timeOfDay = "Early morning"
case 6, 7, 8, 9, 10, 11:
    timeOfDay = "Morning"
case 12, 13, 14, 15, 16:
    timeOfDay = "Afternoon"
case 17, 18, 19:
    timeOfDay = "Evening"
case 20, 21, 22, 23:
    timeOfDay = "Late evening"
default:
    timeOfDay = "INVALID HOUR!"
}
print(timeOfDay)

switch hourOfDay {
case 0...5:
    timeOfDay = "Early morning"
case 6...11:
    timeOfDay = "Morning"
case 12...16:
    timeOfDay = "Afternoon"
case 17...19:
    timeOfDay = "Evening"
case 20..<24:
    timeOfDay = "Late evening"
default:
    timeOfDay = "INVALID HOUR!"
}
print(timeOfDay)

switch number {
case _ where number % 2 == 0:
    print("Even")
default:
    print("Odd")
}

let coordinates = (x: 3, y: 2, z: 5)

switch coordinates {
case (0, 0, 0):
    print("Origin")
case (_, 0, 0):
    print("On the x-axis.")
case (0, _, 0):
    print("On the y-axis.")
case (0, 0, _):
    print("On the z-axis.")
default:
    print("Somewhere in space")
}

switch coordinates {
case (0, 0, 0):
    print("Origin")
case (let x, 0, 0):
    print("On the x-axis at x = \(x)")
case (0, let y, 0):
    print("On the y-axis at y = \(y)")
case (0, 0, let z):
    print("On the z-axis at z = \(z)")
case let (x, y, z):
    print("Somewhere in space at x = \(x), y = \(y), z = \(z)")
}

switch coordinates {
case let (x, y, _) where y == x:
    print("Along the y = x line.")
case let (x, y, _) where y == x * x:
    print("Along the y = x^2 line.")
default:
    break
}

// mini exercise
let age = 30

switch age {
case 0...2:
    print("Infant")
case 3...12:
    print("Child")
case 13...19:
    print("Teenager")
case 20...39:
    print("Adult")
case 40...60:
    print("Middle-aged")
default:
    print("Elderly")
}

let tuple = (name:"Tolga",age: 30)
switch tuple {
case (let name, 0...2):
    print("\(name) is an Infant")
case (let name, 3...12):
    print("\(name) is a Child")
case (let name, 13...19):
    print("\(name) is a Teenager")
case (let name, 20...39):
    print("\(name) is an Adult")
case (let name, 40...60):
    print("\(name) is a Middle-aged")
case let (name, age) where age >= 61:
    print("\(name) is an Elderly")
default:
    print("Invalid age")
}

// MARK: - challenge 1
var sam = 0
for i in 0...5 {
    sam += i
}
print("\(sam)")

// MARK: - challenge 2
var aLotOfAs = ""
while aLotOfAs.count < 10 {
    aLotOfAs += "a"
}
print("\(aLotOfAs)")

// MARK: - challenge 3
let coordinates1 = (1, 5, 0)  //"On the x/y plane\n"
let coordinates2 = (2, 2, 2)  //"x = y = z\n"
let coordinates3 = (3, 0, 1)  //"On the x/z plane\n"
let coordinates4 = (3, 2, 5)  //"Nothing special\n"
let coordinates5 = (0, 2, 4)  //"On the y/z plane\n"

switch coordinates1 {
case let (x, y, z) where x == y && y == z:
  print("x = y = z")
case (_, _, 0):
  print("On the x/y plane")
case (_, 0, _):
  print("On the x/z plane")
case (0, _, _):
  print("On the y/z plane")
default:
  print("Nothing special")
}

switch coordinates2 {
case let (x, y, z) where x == y && y == z:
  print("x = y = z")
case (_, _, 0):
  print("On the x/y plane")
case (_, 0, _):
  print("On the x/z plane")
case (0, _, _):
  print("On the y/z plane")
default:
  print("Nothing special")
}

switch coordinates3 {
case let (x, y, z) where x == y && y == z:
  print("x = y = z")
case (_, _, 0):
  print("On the x/y plane")
case (_, 0, _):
  print("On the x/z plane")
case (0, _, _):
  print("On the y/z plane")
default:
  print("Nothing special")
}

switch coordinates4 {
case let (x, y, z) where x == y && y == z:
  print("x = y = z")
case (_, _, 0):
  print("On the x/y plane")
case (_, 0, _):
  print("On the x/z plane")
case (0, _, _):
  print("On the y/z plane")
default:
  print("Nothing special")
}

switch coordinates5 {
case let (x, y, z) where x == y && y == z:
  print("x = y = z")
case (_, _, 0):
  print("On the x/y plane")
case (_, 0, _):
  print("On the x/z plane")
case (0, _, _):
  print("On the y/z plane")
default:
  print("Nothing special")
}

// MARK: - challenge 4
// Fuck you that's why

let halfOpenRange1 = 100..<100 // empty
let closedRange1 = 100...100   // contains the number 100

halfOpenRange1.isEmpty
closedRange1.isEmpty

// MARK: - challenge 5
var countdown = 11
for _ in 0...10 {
    countdown -= 1
    print("\(countdown)")
}

for i in 0...10 {
    print(10 - i)
}

// MARK: - challenge 6
var value: Float = 0.0
for _ in 0...10 {
    print(value)
    value += 0.1
}

for counter in 0...10 {
    print("\(Float(counter) * 0.1)")
}
