import UIKit

var str = "Hello, playground"

let value = Int("3")
let failedValue = Int("nope")
print(value!)

enum PetFood: String {
    case kibble, canned
}

let morning = PetFood(rawValue: "kibble")
let snack = PetFood(rawValue: "fuuud!")
print(snack?.rawValue ?? "++")

struct PetHouse {
    let squareFeet: Int
    
    init?(squareFeet: Int) {
        if squareFeet < 1 {
            return nil
        }
        self.squareFeet = squareFeet
    }
}

let tooSmall = PetHouse(squareFeet: 0)
let house = PetHouse(squareFeet: 1)
print(house?.squareFeet as Any)

class Pet2 {
    var breed: String?
    
    init(breed: String? = nil) {
        self.breed = breed
    }
}

class Person2 {
    let pet: Pet2
    
    init(pet: Pet2) {
        self.pet = pet
    }
}

let delia = Pet2(breed: "pug")
let olive = Pet2()

let janie2 = Person2(pet: olive)
let dogBreed = janie2.pet.breed

if let dogBreed = janie2.pet.breed {
    print("Olive is a \(dogBreed)")
} else {
    print("Olive's breed is unknown.")
}

class Toy {
    
    enum Kind {
        case ball
        case zombie
        case bone
        case mouse
    }
    
    enum Sound {
        case squeak
        case bell
    }
    
    let kind: Kind
    let color: String
    var sound: Sound?
    
    init(kind: Kind, color: String, sound: Sound? = nil) {
        self.kind = kind
        self.color = color
        self.sound = sound
    }
}

class Pet {
    
    enum Kind {
        case dog
        case cat
        case guineaPig
    }
    
    let name: String
    let kind: Kind
    let favoriteToy: Toy?
    
    init(name: String, kind: Kind, favoriteToy: Toy? = nil) {
        self.name = name
        self.kind = kind
        self.favoriteToy = favoriteToy
    }
}

class Person {
    let pet: Pet?
    
    init(pet: Pet? = nil) {
        self.pet = pet
    }
}

let janie = Person(pet: Pet(name: "Delia", kind: .dog,
                   favoriteToy: Toy(kind: .ball,
                   color: "Purple", sound: .bell)))

let tammy = Person(pet: Pet(name: "Evil Cat Overlord",
                   kind: .cat, favoriteToy: Toy(kind: .mouse,
                   color: "Orange")))

let felipe = Person()

if let sound = janie.pet?.favoriteToy?.sound {
    print("Sound \(sound)")
} else {
    print("No sound.")
}

let a = janie.pet?.favoriteToy?.sound
print(a as Any)

if let sound = tammy.pet?.favoriteToy?.sound {
    print("Sound \(sound)")
} else {
    print("No sound.")
}

if let sound = felipe.pet?.favoriteToy?.sound {
    print("Sound \(sound)")
} else {
    print("No sound.")
}

let team = [janie, tammy, felipe]
let petNames = team.map { $0.pet?.name }
for pet in petNames {
    print(pet as Any)
}
print("\n")

let betterPetNames = team.compactMap { $0.pet?.name }
for pet in betterPetNames {
    print(pet)
}

let board = [[1, 2, nil], [nil, 5, 6]]
print(board.flatMap { $0 })
print(board.flatMap { $0 }.compactMap { $0 })

class Pastry {
    let flavor: String
    var numberOnHand: Int
    
    init(flavor: String, numberOnHand: Int) {
        self.flavor = flavor
        self.numberOnHand = numberOnHand
    }
}

enum BakeryError: Error {
    case tooFew(numberOnHand: Int)
    case doNotSell
    case wrongFlavor
    case inventory
    case noPower
}

class Bakery {
    var itemsForSale = [
        "Cookie": Pastry(flavor: "ChocolateChip", numberOnHand: 20),
        "PopTart": Pastry(flavor: "WildBerry", numberOnHand: 13),
        "Donut": Pastry(flavor: "Sprinkles", numberOnHand: 24),
        "HandPie": Pastry(flavor: "Cherry", numberOnHand: 6)
    ]
    
    func open(_ now: Bool = Bool.random()) throws -> Bool {
        guard now else {
            throw Bool.random() ? BakeryError.inventory
                                : BakeryError.noPower
        }
        return now
    }
    
    func orderPastry(item: String,
                     amountRequested: Int,
                     flavor: String) throws -> Int {
        guard let pastry = itemsForSale[item] else {
            throw BakeryError.doNotSell
        }
        guard flavor == pastry.flavor else {
            throw BakeryError.wrongFlavor
        }
        guard amountRequested <= pastry.numberOnHand else {
            throw BakeryError.tooFew(numberOnHand: pastry.numberOnHand)
        }
        pastry.numberOnHand -= amountRequested
        
        return pastry.numberOnHand
    }
}

let bakery = Bakery()

do {
    try bakery.open()
    try bakery.orderPastry(item: "Albatross",
                       amountRequested: 1,
                       flavor: "AlbatrossFlavor")
} catch BakeryError.inventory, BakeryError.noPower {
    print("Sorry, the bakery is now closed.")
} catch BakeryError.doNotSell {
    print("Sorry, but we do not sell this item.")
} catch BakeryError.wrongFlavor {
    print("Soory, but we don't have the goods with that flavor.")
} catch BakeryError.tooFew {
    print("Sorry, we don't have enough items to fulfill your order.")
}

let open = try? bakery.open(false)
let remaining = try? bakery.orderPastry(item: "Albatross",
                                        amountRequested: 1,
                                        flavor: "AlbatrossFlavor")

do {
    try bakery.open(true)
    try bakery.orderPastry(item: "Cookie",
                           amountRequested: 1,
                           flavor: "ChocolateChip")
} catch {
    fatalError()
}

try! bakery.open(true)
try! bakery.orderPastry(item: "Cookie",
                        amountRequested: 1,
                        flavor: "ChocolateChip")

enum Direction {
    case left
    case right
    case forward
}

enum PugBotError: Error {
    case invalidMove(found: Direction, expected: Direction)
    case endOfPath
}

class PugBot {
    let name: String
    let correctPath: [Direction]
    private var currentStepInPath = 0
    
    init(name: String, correctPath: [Direction]) {
        self.name = name
        self.correctPath = correctPath
    }
    
    func move(_ direction: Direction) throws {
        guard currentStepInPath < correctPath.count else {
            throw PugBotError.endOfPath
        }
        let nextDirection = correctPath[currentStepInPath]
        guard nextDirection == direction else {
            throw PugBotError.invalidMove(found: direction, expected: nextDirection)
        }
        currentStepInPath += 1
    }
    
    func reset() {
        currentStepInPath = 0
    }
}

let pug = PugBot(name: "Pug", correctPath: [.forward, .left, .forward, .right])

func goHome() throws {
    try pug.move(.forward)
    try pug.move(.left)
    try pug.move(.forward)
    try pug.move(.right)
}

do {
    try goHome()
    print("PugBot was successful to get home. Good boy!")
} catch {
    print("PugBot failed to get home.")
}

func moveSafely(_ movement: () throws -> ()) -> String {
    do {
        try movement()
        return "Completed operation successfully."
    } catch PugBotError.invalidMove(let found, let expected) {
        return "The PugBot ws supposed to move \(expected), but moved \(found) instead."
    } catch PugBotError.endOfPath {
        return "The PugBot tried to move past the end of the path."
    } catch {
        return "An unknown error occured."
    }
}

pug.reset()
moveSafely(goHome)

pug.reset()
moveSafely {
    try pug.move(.forward)
    try pug.move(.left)
    try pug.move(.forward)
    try pug.move(.right)
}

func perform(times: Int, movement: () throws -> ()) rethrows {
    for _ in 1...times {
        try movement()
    }
}

do {
    try perform(times: 1, movement: {
       let _ = try bakery.open(false)
    })
} catch {
    print("error")
}

func log(message: String) {
    let thread = Thread.current.isMainThread ? "Main" : "Background"
    print("\(thread) thread: \(message).")
}

func addNumbers(upTo range: Int) -> Int {
    log(message: "Adding numbers...")
    return (1...range).reduce(0, +)
}

//addNumbers(upTo: 50)

let queue = DispatchQueue(label: "queue")

func execute<T>(backgroundWork: @escaping () -> T,
                     mainWork: @escaping (T) -> ()) {
    queue.async {
        let result = backgroundWork()

        DispatchQueue.main.async {
            mainWork(result)
        }
    }
    log(message: "Execution happenning.")
}

execute(backgroundWork: { addNumbers(upTo: 100) },
        mainWork:       { log(message: "The sum is \($0)") })

execute {
    "Tolga"
} mainWork: {
    log(message: $0)
}


//enum Result<Success, Failure> where Failure: Error {
//    case success(Success)
//    case failure(Failure)
//}

struct Tutorial {
    let title: String
    let author: String
}

enum TutorialError: Error {
    case rejected
}

func feedback(for tutorial: Tutorial, success: Bool) -> Result<String, TutorialError> {
    success ? .success("published") : .failure(.rejected)
}

func edit(_ tutorial: Tutorial, success: Bool) {
    queue.async {
        let result = feedback(for: tutorial, success: success)
        DispatchQueue.main.async {
            switch result {
                case let .success(data):
                    print("\(tutorial.title) by \(tutorial.author) was \(data)")
                case let .failure(error):
                    print("\(tutorial.title) by \(tutorial.author) was \(error)")
            }
        }
    }
}

let tutorial = Tutorial(title: "What's new in Swift 5.1",
                        author: "Cosmin Puăză")

edit(tutorial, success: true)

let result = feedback(for: tutorial, success: true)
do {
    let data = try result.get()
    print("\(tutorial.title) by \(tutorial.author) was \(data) on the website.")
} catch {
    print("\(tutorial.title) by \(tutorial.author) was \(error).")
}

// MARK: - Challenge 1
enum NotANumber: Error {
    case notANumber
}

func toEvenNumber(_ string: String) throws -> Int {
    guard let number = Int(string) else {
        throw NotANumber.notANumber
    }
    return number % 2 == 0 ? number : number - 1
}

do {
    //try toEvenNumber("6")
    //try toEvenNumber("five")
    try toEvenNumber("5")
} catch {
    print("Failure: You can't convert.")
}

// MARK: - Challenge 2
enum DivisionError: Error {
    case divisionByZero
}

func divide(_ x: Int, _ y: Int) throws -> Int {
    guard y != 0 else {
        throw DivisionError.divisionByZero
    }
    return x/y
}

do {
    //try divide(10, 0)
    try divide(15, 3)
} catch {
    print("Can not divide by zero.")
}
