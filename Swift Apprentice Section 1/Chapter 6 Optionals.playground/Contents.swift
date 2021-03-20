import UIKit

var str = "Hello, playground"

var errorCode: Int?
errorCode = 100
errorCode = nil

// mini exercise
var myFavouriteSong: String? = "High Hopes"

let parsedInt = Int("10")
let parsedInt2 = Int("dog")

var result: Int? = 30
print(result as Any)

var authorName: String? = "Matt Galloway"
var authorAge: Int? = 30
print("\(String(describing: authorName))")

var unwrappedAuthorName = authorName!
print("Author is \(unwrappedAuthorName)")

/*authorName = nil
print("Author is \(authorName!)")*/

if authorName != nil {
    print("Author is \(authorName!)")
} else {
    print("No author.")
}

if let unwrappedAuthorName = authorName {
    print("Author is \(unwrappedAuthorName)")
} else {
    print("No author")
}

if let authorName = authorName,
   let authorAge = authorAge {
    print("The author is \(authorName) who is \(authorAge) years old.")
} else {
    print("No author or no age.")
}

if let authorName = authorName,
   let authorAge = authorAge,
   authorAge >= 40{
    print("The author is \(authorName) who is \(authorAge) years old.")
} else {
    print("No author or no age or less than 40.")
}

// mini exercise
var myFavoriteSong: String? = "High Hopes"
myFavoriteSong = nil

if let myFavoriteSong = myFavoriteSong {
    print("My favorite song is \(myFavoriteSong).")
} else {
    print("I don't have a favorite song.")
}

func guardMyCastle(name: String?) {
    guard let castleName = name else {
        print("No castle!")
        return
    }
    print("Your castle called \(castleName) was guarded!")
}
guardMyCastle(name: "Rampart")

func calculateNumberOfSides(shape: String) -> Int? {
    switch shape {
    case "Triangle":
        return 3
    case "Square":
        return 4
    case "Rectangle":
        return 4
    case "Pentagon":
        return 5
    case "Hexagon":
        return 6
    default:
        return nil
    }
}

func maybePrintSides(shape: String) {
    let sides = calculateNumberOfSides(shape: shape)
    
    if let sides = sides {
        print("A \(shape) has \(sides) sides.")
    } else {
        print("I don't know the number of sides for \(shape).")
    }
}

func maybePrintSides1(shape: String) {
    guard let sides = calculateNumberOfSides(shape: shape) else {
        print("I don't know the number of sides for \(shape).")
        return
    }
    print("A \(shape) has \(sides) sides.")
}

var optionalInt: Int? = 10
var mustHaveResult = optionalInt ?? 0

var optionalInt2: Int? = nil
var mustHaveResult2: Int
if let unwrapped = optionalInt2 {
    mustHaveResult2 = unwrapped
} else {
    mustHaveResult2 = 0
}

// MARK: - Challenge 1
var name: String? = "Ray"
// var age: Int = nil
let distance: Float = 26.7
var middleName: String? = nil

// MARK: - Challenge 2
func divideIfWhole(_ value: Int, by divisor: Int) -> Int? {
    if value % divisor == 0 {
        return value / divisor
    } else {
        return nil
    }
}

if let answer = divideIfWhole(10, by: 2) {
    print("Yep, it divides \(answer) times")
} else {
    print("Not divisible :(")
}
if let answer = divideIfWhole(10, by: 3) {
    print("Yep, it divides \(answer) times")
} else {
    print("Not divisible :(")
}

// MARK: - Challenge 3
let answer1 = divideIfWhole(10, by: 2) ?? 0
print("It divides \(answer1) times")

let answer2 = divideIfWhole(10, by: 3) ?? 0
print("It divides \(answer2) times")

// MARK: - Challenge 4
let number: Int??? = 10
print(number as Any)
print(number!!!)

if let number = number {
    if let number = number {
        if let number = number {
    print("Number: \(number)")
            }
        }
    } else {
    print("There is no number")
}

if let n1 = number,
   let n2 = n1,
   let n3 = n2 {
    print(n3)
} else {
    print("There is no number")
}

func printNumber(_ number: Int???) {
    guard let n1 = number, let n2 = n1, let n3 = n2 else {
        print("There is no number")
        return
    }
    print("Number: \(n3)")
}
printNumber(number)

