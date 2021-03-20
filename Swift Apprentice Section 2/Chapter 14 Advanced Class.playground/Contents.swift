import UIKit

var str = "Hello, playground"

struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    deinit {
        print("\(firstName) \(lastName) is being removed from memory!")
    }
}

class Student1 {
    var firstName: String
    var lastName: String
    var grades: [Grade] = []
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

class Student: Person {                 // Student: subclass, derived class
    var grades: [Grade] = []            // Person: superclass, base class
    weak var partner: Student?
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
    
    static var graduates: [String] = []
    
    deinit {
        Student.graduates.append("\(firstName), \(lastName)")      // Mini Exercise
    }
    
//    deinit {
//        print("\(firstName) is being deallocated!")
//    }
}

var alice: Student? = Student(firstName: "Alice",
                              lastName: "Appleseed")
var bob: Student? = Student(firstName: "Bob",
                            lastName: "Appleseed")
Student.graduates.count
alice?.partner = bob
bob?.partner = alice

//alice = nil
Student.graduates.count
//bob = nil
Student.graduates.count
bob?.partner?.firstName
alice?.partner?.firstName
//bob?.partner = nil
bob?.firstName
alice?.firstName
bob = nil
alice = nil

let john = Person(firstName: "John", lastName: "Anderson")
let jane = Student(firstName: "Jane", lastName: "White")

john.firstName
jane.firstName

let history = Grade(letter: "B", points: 9.0, credits: 3.0)
jane.recordGrade(history)
//john.recordGrade(history)

class BandMember: Student {
    var minimumPracticeTime = 2
}

class OboePlayer: BandMember {
    override var minimumPracticeTime: Int {
        get {
            super.minimumPracticeTime * 2
        }
        set {
            super.minimumPracticeTime = newValue / 2
        }
    }
}

func phonebookName(_ person: Person) -> String {
    if let bandMember = person as? BandMember {
        print(bandMember.minimumPracticeTime)
    }
    return "\(person.lastName), \(person.firstName)"
}

let person = Person(firstName: "Adam", lastName: "Anderson")
let oboePlayer = OboePlayer(firstName: "Meryl", lastName: "Pinkman")

phonebookName(person)
phonebookName(oboePlayer)

var hallMonitor = Student(firstName: "Ada", lastName: "Strife")
hallMonitor = oboePlayer

let castedOboePlayer = oboePlayer as Student
//(oboePlayer as Student).minimumPracticeTime      Error: Value of type 'Student' has no member 'minimumPracticeTime'

(hallMonitor as? BandMember)?.minimumPracticeTime
var hallMonitor2 = hallMonitor as? BandMember
print(hallMonitor2 as Any)
(hallMonitor as! BandMember).minimumPracticeTime

if let hallMonitor = hallMonitor as? BandMember {
    print("""
          This hall monitor is a band member and practices
          at least \(hallMonitor.minimumPracticeTime)
          hours per week.
          """)
}

func afterClassActivity(for student: Student) -> String {
    "Goes home!"
}

func afterClassActivity(for student: BandMember) -> String {
    "Goes practice!"
}

afterClassActivity(for: oboePlayer)
afterClassActivity(for: oboePlayer as Student)

class StudentAthlete: Student {
    var failedClasses: [Grade] = []
    
    override func recordGrade(_ grade: Grade) {
        super.recordGrade(grade)
        
        var newFailedClasses: [Grade] = []
        for grade in grades {
            if grade.letter == "F" {
                newFailedClasses.append(grade)
            }
        }
        failedClasses = newFailedClasses
    }
    
    var isEligible: Bool {
        failedClasses.count < 3
    }
}

let puşkin = StudentAthlete(firstName: "Tifa", lastName: "Rosefield")
puşkin.recordGrade(history)
puşkin.isEligible


final class FinalStudent: Person {}
// class FinalStudentAthlete: FinalStudent {}    Error: Inheritance from a final class 'FinalStudent'

class AnotherStudent: Person {
    final func recordGrade(_ grade: Grade) {}
}

//class AnotherStudentAthlete: AnotherStudent {
//    override func recordGrade(_ grade: Grade) {}    Error: Instance method overrides a 'final' instance method
//}

// Minik Exercise
// Person is the base class. You don't need an initialization in the base class.

class Newstudent {

    let firstName: String
    let lastName: String
    var grades: [Grade] = []

    required init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    convenience init(transfer: Newstudent) {
        self.init(firstName: transfer.firstName,
                  lastName: transfer.lastName)
    }
    
    convenience init(foreign: Newstudent) {
        self.init(firstName: foreign.firstName,
                  lastName: foreign.lastName)
    }

    convenience init(erasmus: Newstudent) {
        self.init(transfer: erasmus)
    }

    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

class NewstudentAthlete: Newstudent {
    var sports: [String]
    
    required init(firstName: String, lastName: String) {
        self.sports = []
        super.init(firstName: firstName, lastName: firstName)
    }
    
    init(firstName: String, lastName: String, sports: [String]) {
        self.sports = sports
        let passGrade = Grade(letter: "P", points: 0.0, credits: 0.0)
        super.init(firstName: firstName, lastName: lastName)
        recordGrade(passGrade)
    }
    
    var failedClasses: [Grade] = []
    
    override func recordGrade(_ grade: Grade) {
        super.recordGrade(grade)
        
        var newFailedClasses: [Grade] = []
        for grade in grades {
            if grade.letter == "F" {
                newFailedClasses.append(grade)
            }
        }
        failedClasses = newFailedClasses
    }
    
    var isEligible: Bool {
        failedClasses.count < 3
    }
}


// Minik Exercise
// the convenience initializers are able to call the other convenience initializers in addition to the designated initializer.

let julia = Newstudent(foreign: Newstudent(firstName: "Julia", lastName: "Ford"))
let Carlos = Newstudent(erasmus: Newstudent(firstName: "Carlos", lastName: "Manson"))
let Nathan = Newstudent(transfer: Newstudent(firstName: "Nathan", lastName: "Kemper"))

class Team {
    var players: [StudentAthlete] = []
    
    var isEligible: Bool {
        for player in players {
            if !player.isEligible {
                return false
            }
        }
        return true
    }
}

class Button {
    func press() {}
}

class Image {}

class ImageButton: Button {
    var image: Image
    
    init(image: Image) {
        self.image = image
    }
}

class TextButton: Button {
    var text: String
    
    init(text: String) {
        self.text = text
    }
}

var someone = Person(firstName: "Johnny", lastName: "Appleseed")
var anotherSomeone: Person? = someone
var lotsOfPeople = [someone, someone, anotherSomeone, someone]
anotherSomeone = nil
lotsOfPeople = []
someone = Person(firstName: "Johnny", lastName: "Appleseed")

// MARK: - Challenge 1, 2, 3
class A {
    deinit {
        print("Deallocate A")
    }
    
    init() {
        print("I'm A")
    }
}
class B: A {
    deinit {
        print("Deallocate B")
    }
    
    override init() {
        print("I'm B(1)")
        super.init()
        print("I'm B(2)")
    }
}
class C: B {
    deinit {
        print("Deallocate C")
    }
    
    override init() {
        print("I'm C(1)")
        super.init()
        print("I'm C(2)")
    }
}

//let c = C()
do {
    let _ = C()
}

let c = C()
let castedA = c as A

//let a: A = C()
let castedC = castedA as! C

// MARK: - Challenge 4
class StudentBaseballPlayer: StudentAthlete {
    var position: String
    var number: Int
    var battingAverage = 0.0
    
    init(firstName: String, lastName: String, number: Int, position: String) {
        self.number = number
        self.position = position
        super.init(firstName: firstName, lastName: lastName)
    }
}

