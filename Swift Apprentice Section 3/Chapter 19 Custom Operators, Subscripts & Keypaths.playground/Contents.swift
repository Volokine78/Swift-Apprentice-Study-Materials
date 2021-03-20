import UIKit

var str = "Hello, playground"

precedencegroup ExponentiationPrecedence {
    associativity: right
    higherThan: MultiplicationPrecedence
}

infix operator **: ExponentiationPrecedence

func **<T: BinaryInteger>(base: T, power: Int) -> T {
    precondition(power >= 2)
    var result = base
    for _ in 2...power {
        result *= base
    }
    return result
}

let base = 2
let exponent = 3
let result = base ** exponent

infix operator **=

func **=<T: BinaryInteger>(lhs: inout T, rhs: Int) {
    lhs = lhs ** rhs
}

let unsignedBase: UInt = 2
let unsignedResult = unsignedBase ** exponent

let base8: Int8 = 2
let result8 = base8 ** exponent

let unsignedBase8: UInt8 = 2
let unsignedResult8 = unsignedBase8 ** exponent

let base16: Int16 = 2
let result16 = base16 ** exponent

let unsignedBase16: UInt16 = 2
let unsignedResult16 = unsignedBase16 ** exponent

let base32: Int32 = 2
let result32 = base32 ** exponent

let unsignedBase32: UInt32 = 2
let unsignedResult32 = unsignedBase32 ** exponent

let base64: Int64 = 2
let result64 = base64 ** exponent

let unsignedBase64: UInt64 = 2
let unsignedResult64 = unsignedBase64 ** exponent

var number = 2
number **= exponent

// Mini Exercise
func ***(base: String, count: Int) -> String {
    precondition(count >= 2)
    var result = base
    for _ in 2...count {
        result += base
    }
    return result
}

infix operator ***

func **(base: String, count: Int) -> String {
    guard count > 0 else {
        return ""
    }
    guard count > 1 else {
        return base
    }
    var result = base
    for _ in 2...count {
        result += base
    }
    return result
}

let baseString = "abc"
let times = 5
let oneTime = 1
let zeroTime = 0
var multipliedString = baseString ** times
var multipliedString2 = baseString ** oneTime
var multipliedString3 = baseString ** zeroTime
var multipliedString4 = baseString ** oneTime
var multipliedString5 = baseString *** times

func **=(lhs: inout String, rhs: Int) {
    lhs = lhs ** rhs
}

multipliedString **= times

2 * (2 ** (3 ** 2))
2 * 2 ** 3 ** 2

class Person {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension Person {
    subscript(key: String) -> String? {
        switch key {
            case "name":
                return name
            case "age":
                return "\(age)"
            default:
                return nil
        }
    }
}

let me = Person(name: "Cosmin", age: 33)

me["name"]
me["age"]
me["gender"]

class File {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    static subscript(key: String) -> String {
        switch key {
            case "path":
                return "custom path"
            default:
                return "default path"
        }
    }
}

File["path"]
File["PATH"]

@dynamicMemberLookup
class Instrument {
    let brand: String
    let year: Int
    private let details: [String: String]
    
    init(brand: String, year: Int, details: [String: String]) {
        self.brand = brand
        self.year = year
        self.details = details
    }
    
    subscript(dynamicMember key: String) -> String {
        switch key {
            case "info":
                return "\(brand) made in \(year)."
            default:
                return details[key] ?? ""
        }
    }
}

let instrument = Instrument(brand: "Roland", year: 2019, details: ["type": "acoustic",
                                                                   "pitch": "C"])
instrument.info
instrument.pitch
instrument.dlfksdf
instrument.brand
instrument.year

class Guitar: Instrument {}
let guitar = Guitar(brand: "Fender", year: 2019, details: ["type": "electric", "pitch": "C"])
guitar.info

@dynamicMemberLookup
class Folder {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    class subscript(dynamicMember key: String) -> String {
        switch key {
            case "path":
                return "custom path"
            default:
                return "default path"
        }
    }
}

Folder.path
Folder.PATH

class Tutorial {
    let title: String
    let author: Person
    let details: (type: String, category: String)
    
    init(title: String, author: Person,
         details: (type: String, category: String)) {
        self.title = title
        self.author = author
        self.details = details
    }
}

let tutorial = Tutorial(title: "Object Oriented Programming in Swift", author: me,
                        details: (type: "swift", category: "iOs"))

let title = \Tutorial.title
let tutorialTitle = tutorial[keyPath: title]

let authorName = \Tutorial.author.name
var tutorialAuthor = tutorial[keyPath: authorName]

let type = \Tutorial.details.type
let tutorialType = tutorial[keyPath: type]
let category = \Tutorial.details.category
let tutorialCategory = tutorial[keyPath: category]

let authorPath = \Tutorial.author
let authorNamePath = authorPath.appending(path: \.name)
tutorialAuthor = tutorial[keyPath: authorNamePath]

class Jukebox {
    var song: String
    
    init(song: String) {
        self.song = song
    }
}

let jukebox = Jukebox(song: "Nothing Else Matters")
let song = \Jukebox.song
jukebox[keyPath: song] = "Shine on You Crazy Diamond"

struct Point {
    let x, y: Int
}

@dynamicMemberLookup
struct Circle {
    let center: Point
    let radius: Int
    
    subscript(dynamicMember keyPath: KeyPath<Point, Int>) -> Int {
        center[keyPath: keyPath]
    }
}

let center = Point(x: 1, y: 2)
let circle = Circle(center: center, radius: 1)
circle.x
circle.y

// MARK: - Challenge 1
extension Array {
    subscript(index index: Int) -> (String, String)? {
        guard let value = self[index] as? Int else {
            return nil
        }
        
        switch (value >= 0, abs(value) % 2) {
            case (true, 0):
                return ("positive", "even")
            case (true, 1):
                return ("positive", "odd")
            case (false, 0):
                return ("negative", "even")
            case (false, 1):
                return ("negative", "odd")
            default:
                return nil
        }
    }
}

let numbers = [1, 2, -1, -2]
numbers[index: 0]
numbers[index: 1]
numbers[index: 2]
numbers[index: 3]

// MARK: - Challenge 2
extension String {
    subscript(index: Int) -> Character? {
        guard (0..<count).contains(index) else {
            return nil
        }
        return self[self.index(startIndex, offsetBy: index)]
    }
}

let string = "Aytek"
string[3]
string[56]

string[string.startIndex]
string[string.index(string.startIndex, offsetBy: 3)]

// MARK: - Challenge 3
infix operator *+

func *+<T: FloatingPoint>(base: T, power: Int) -> T {
    precondition(power >= 2)
    var result = base
    for _ in 2...power {
        result *= base
    }
    return result
}

let exponent1 = 2
let baseDouble = 2.0
var resultDouble = baseDouble *+ exponent1
let baseFloat: Float = 2.0
var resultFloat = baseFloat *+ exponent1
let baseCG: CGFloat = 2.0
var resultCG = baseCG *+ exponent1

// MARK: - Challenge 4
infix operator *+=

func *+=<T: FloatingPoint>(lhs: inout T, rhs: Int) {
    lhs = lhs *+ rhs
}

resultDouble *+= exponent1
resultFloat *+= exponent1
resultCG *+= exponent1

infix operator **-

func **-(userName: String, domain: String) -> String {
    return userName + "@" + domain
}

"aytek" **- "hotmail.com"
let users = ["aytek", "serdar", "tolga"]

func createEmailAdress(user: String) -> String {
    return user + "@" + "gmail.com"
}

for user in users {
    print(createEmailAdress(user: user))
}

print(users.map(createEmailAdress))
users.reduce("", **-)

