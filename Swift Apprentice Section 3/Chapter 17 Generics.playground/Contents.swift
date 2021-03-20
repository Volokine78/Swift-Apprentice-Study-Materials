               import UIKit

var str = "Hello, playground"

enum PetKind {
    case cat
    case dog
}

struct KeeperKind {
    var keeperOf: PetKind
}

let catKeeper = KeeperKind(keeperOf: .cat)
let dogKeeper = KeeperKind(keeperOf: .dog)

enum EnumKeeperKind {
    case catKeeper
    case dogKeeper
}

class Cat1 {}
class Dog1 {}

class KeeperOfCats {}
class KeeperOfDogs {}

class Keeper1<Animal> {}
var dictionary: [String: Int]

var aCatKeeper = Keeper1<Cat1>()
//var aKeeper = Keeper()   Generic parameter 'Animal' could not be inferred

class Cat2 {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Dog2 {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Keeper2<Animal: Pet> {          // Type constraint
    var name: String
    var morningCare: Animal
    var afternoonCare: Animal
    
    init(name: String, morningCare: Animal, afternoonCare: Animal) {
        self.name = name
        self.morningCare = morningCare
        self.afternoonCare = afternoonCare
    }
}

protocol Pet {
    var name: String { get }
}
extension Cat2: Pet {}
extension Dog2: Pet {}
extension String: Pet {
    var name: String {
        return self
    }
}
extension Int: Pet {
    var name: String {
        return "\(self)"
    }
}
1.name

let jason = Keeper2(name: "Jason",
                   morningCare: Cat2(name: "Whiskers"),
                   afternoonCare: Cat2(name: "Sleepy"))
print(jason.morningCare.name)

// Minik Exercise
//let freddy = Keeper(name: "Freddy",
//                   morningCare: Dog(name: "Whiskers"),
//                   afternoonCare: Cat(name: "Sleepy"))
//Error: Conflicting arguments to generic parameter 'Animal' ('Dog' vs. 'Cat')

let cesar = Keeper2(name: "Cesar", morningCare: "Whiskers", afternoonCare: "Sleepy")
//Error: Generic class 'Keeper' requires that 'String' conform to 'Pet'
print(cesar.morningCare.name)
"Tolga".name

extension Array where Element: Cat2 {
    func meow() {
        forEach { print("\($0.name) says meow!") }
    }
}

protocol Meowable {
    func meow()
}

extension Cat2: Meowable {
    func meow() {
        print("\(self.name) says meow!")
    }
}

extension Array: Meowable where Element: Meowable {
    func meow() {
        forEach { $0.meow() }
    }
}

let minik1 = Cat2(name: "minik")
let boncuk1 = Cat2(name: "boncuk")
let oscar1 = Cat2(name: "oscar")
minik1.meow()
let cats: [Cat2] = [oscar1, minik1, boncuk1]
cats.meow()

let animalAges: [Int] = [2, 5, 7, 9]
let animalAges2: Array<Int> = [2 ,5, 7, 9]
let animalAges3 = [Int]()

//struct Dictionary<Key: Hashable, Value> {}
let intNames: Dictionary<Int, String> = [42: "forty-two"]
let intNames2: [Int: String] = [42: "forty-two", 7: "seven"]
let intNames3 = [42: "forty-two", 7: "seven"]

enum OptionalDate {
    case none
    case some(Date)
}

enum OptionalString {
    case none
    case some(String)
}

struct FormResults {
    var birthday: OptionalDate
    var lastName: OptionalString
}

//enum Optional<Wrapped> {
//    case none
//    case some(Wrapped)
//}

var birthdate: Optional<Date> = .none
if birthdate == .none {}

var birthdate2: Date? = nil
if birthdate2 == nil {}

func swapped<T, U>(_ x: T, _ y: U) -> (U, T) {
    (y, x)
}
swapped(33, "Jay")

// MARK: - Challenge
class Cat {
    var name: String

    init(name: String) {
        self.name = name
    }
}

class Dog {
    var name: String

    init(name: String) {
        self.name = name
    }
}

class Keeper<Animal> {
    var name: String
    private var animals: [Animal] = []
    
    func lookAfter(_ animal: Animal) {
        animals.append(animal)
    }
    
    var countAnimals: Int { animals.count }
    
    func removeLast() -> Animal {
        animals.removeLast()
    }
    
    func animalAtIndex(at index: Int) -> Animal {
        animals[index]
    }

    init(name: String) {
        self.name = name
    }
}

let minik = Cat(name: "minik")
let boncuk = Cat(name: "boncuk")
let oscar = Cat(name: "oscar")

let christine = Keeper<Cat>(name: "Christine")
christine.lookAfter(boncuk)
christine.lookAfter(minik)
christine.lookAfter(oscar)
print(christine.animalAtIndex(at: 2).name)
christine.countAnimals

