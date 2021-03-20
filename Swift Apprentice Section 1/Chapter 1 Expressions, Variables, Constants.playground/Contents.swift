import UIKit
import Foundation

var str = "Hello, playground"
print("Hello Swift Apprentice reader")

2 + 6
10 - 2
2 * 4
24 / 3
22.0 / 7.0
28 % 10
(28.0).truncatingRemainder(dividingBy: 10.0)
1 << 3
32 >> 2
((8000 / (5 * 10)) - 32) >> (29 % 5)
350 / 5 + 2
sin(45 * Double.pi / 180)
cos(135 * Double.pi / 180)
(2.0).squareRoot()
max(5, 10)
min(-5, -10)
max((2.0).squareRoot(), Double.pi / 2)
let number: Int = 10
var variableNumber: Int = 42
variableNumber = 0
variableNumber = 1_000_000

var counter = 0
counter += 1
counter -= 1
counter = 10
counter *= 3
counter /= 2

var averageAge: Double = 30
let testNumber = 10
let evenOdd = 8

var answer = 0
answer += 1
answer += 10
answer *= 10
answer >> 3

// MARK: - challenge 1
let myAge: Int = 30
var dogs: Int = 0
dogs += 1

// MARK: - challenge 2
var age: Int = 16
print(age)
age = 30
print(age)

// MARK: - challenge 3
let x: Int = 46
let y: Int = 10

let answer1: Int = (x * 100) + y
let answer2: Int = (x * 100) + (y * 100)
let answer3: Int = (x * 100) + (y / 10)

// MARK: - challenge 4
8 - 4 * 2 + 6 / 3 * 4
8 - (4 * 2) + ((6 / 3) * 4)

// MARK: - challenge 5
let rating1: Double = 5
let rating2: Double = 6
let rating3: Double = 8
let averageRating: Double = (rating1 + rating2 + rating3) / 3

// MARK: - challenge 6
let voltage: Double = 120
let current: Double = 200
let power: Double = voltage * current

// MARK: - challenge 7
let resistance: Double = power / (current * current)

// MARK: - challenge 8
let randomNumber = arc4random()
let diceRoll = randomNumber % 6 + 1

// MARK: - challenge 9
let a: Double = 2.0
let b: Double = 3.0
let c: Double = 1.0

let root1: Double = (-b + (b*b - 4*a*c).squareRoot()) / (2 * a)
let root2: Double = (-b - (b*b - 4*a*c).squareRoot()) / (2 * a)

