import UIKit

var str = "Hello, playground"

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let john = Person(firstName: "Johnny", lastName: "Appleseed")
let Jane = Person(firstName: "Jane", lastName: "Appleseed")

class SimplePerson {
    let name: String
    let age = 26
    let profession = "iOS Developer"
    init(name: String) {
        self.name = name
    }
}

var var1 = SimplePerson(name: "John")
var var2 = var1
print(var1.name)
print(var2.name)

struct Location {
    let x: Int
    let y: Int
}

struct DeliveryArea {
    var range: Double
    let center: Location
}

var area1 = DeliveryArea(range: 2.5, center: Location(x: 2, y: 4))

var area2 = area1
print(area1.range)
print(area2.range)

area1.range = 4
print(area1.range)
print(area2.range)

var homeOwner = john
print(homeOwner.firstName)
john.firstName = "John"
john.firstName
homeOwner.firstName

// Mini Exercise
//homeOwner.lastName = "Pomegranateseed"
print(john.lastName)
print(homeOwner.lastName)

john === homeOwner

let imposterJohn = Person(firstName: "Johnny", lastName: "Appleseed")
john === imposterJohn
imposterJohn === homeOwner

homeOwner = imposterJohn
john === homeOwner

homeOwner = john
john === homeOwner
john === imposterJohn
homeOwner === imposterJohn
john.lastName

var imposters = (0...100).map { _ in
    Person(firstName: "John", lastName: "Appleseed")
}

imposters.contains {
    $0.firstName == john.firstName && $0.lastName == john.lastName
}

//imposters.contains {
//    $0 == john        Binary operator '==' cannot be applied to two 'Person' operands
//}

imposters.contains {
    $0 === john || $0 === homeOwner
}

imposters.insert(john, at: Int.random(in: 0..<100))

imposters.contains {
    $0 === john
}

if let indexOfJohn = imposters.firstIndex(where: { $0 === john }) {
    imposters[indexOfJohn].lastName = "Bananapeel"
}

print(john.fullName)

// Minik Exercise
func memberOf(person: Person, group: [Person]) -> Bool {
    group.contains {
        $0 === person
    }
}

let mack = Person(firstName: "Mack", lastName: "Johnson")
let marianna = Person(firstName: "Marrianna", lastName: "Anderson")
let michael = Person(firstName: "Micheal", lastName: "Jordan")
let jack = Person(firstName: "Jack", lastName: "Sparrow")
let lebron = Person(firstName: "Lebron", lastName: "James")
let can = Person(firstName: "Can", lastName: "Yucel")
let elon = Person(firstName: "Elon", lastName: "Musk")
let friedrich = Person(firstName: "Friedrich", lastName: "Nietzsche")
let steve = Person(firstName: "Steve", lastName: "Jobs")

let personArray1 = [mack, marianna, michael, jack, lebron]
let personArray2 = [can, elon, friedrich, steve, john]

memberOf(person: john, group: personArray1)
memberOf(person: john, group: personArray2)

struct Grade {
    let letter: String
    let points: Double
    let credits: Double
}

class Student {
    var firstName: String
    var lastName: String
    var grades: [Grade] = []
    var credits = 0.0
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
        credits += grade.credits
    }
}

extension Student {
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let jane = Student(firstName: "Jane", lastName: "Middleton")
let history = Grade(letter: "B", points: 9.0, credits: 3.0)
var math = Grade(letter: "A", points: 16.0, credits: 4.0)

jane.recordGrade(history)
jane.recordGrade(math)
jane.grades

jane.credits

math = Grade(letter: "A", points: 20.0, credits: 5.0)
jane.recordGrade(math)
jane.credits

// Minik Exercise
struct Grade1 {
    let letter: String
    let points: Double
    let credits: Double
}

class Student1 {
    var firstName: String
    var lastName: String
    var grades: [Grade1] = []
    var GPA: Double {
        var totalPoints = 0.0
        var totalCredits = 0.0
        for grade in grades {
            totalPoints += grade.points
            totalCredits += grade.credits
        }
        return totalPoints / totalCredits
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func recordGrade(_ grade: Grade1) {
        grades.append(grade)
    }
}

let aytek = Student1(firstName: "Tom", lastName: "Johnson")
let physics = Grade1(letter: "E", points: 55, credits: 4.0)
let chemistry = Grade1(letter: "F", points: 45, credits: 5.0)

aytek.recordGrade(physics)
aytek.recordGrade(chemistry)
aytek.GPA

// MARK: - Challenge 1
class User {
    var lists: [String: List] = [:]
    
    func addList(_ list: List) {
        lists[list.name] = list
    }
    
    func list(forName name: String) -> List? {
        lists[name]
    }
}

struct List {
    let name: String
    var movieTitles: [String] = []
    
    init(name: String) {
        self.name = name
    }
    
    func print() {
        Swift.print("Movie list: \(name)")
        for movie in movieTitles {
            Swift.print(movie)
        }
        Swift.print("\n")
    }
}

let jone = User()
let jehn = User()
var scienceFictionList = List(name: "Science Fiction")

jone.addList(scienceFictionList)
jehn.addList(scienceFictionList)

jone.lists["Science Fiction"]?.movieTitles.append("Matrix")
jone.lists["Science Fiction"]?.movieTitles.append("Dark City")
scienceFictionList.movieTitles.append("Star Wars")

jehn.lists["Science Fiction"]?.movieTitles.append("Looper")

jone.lists["Science Fiction"]?.print()
jehn.lists["Science Fiction"]?.print()
print(scienceFictionList.movieTitles)

// MARK: - Challenge 2
//struct TShirt
//class User
//struct Address
//class ShoppingCart
