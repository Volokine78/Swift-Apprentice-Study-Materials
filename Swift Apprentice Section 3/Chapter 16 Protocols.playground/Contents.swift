import UIKit

var str = "Hello, playground"

protocol Vehicle {
    func accelerate()
    func stop()
}

class Unicycle: Vehicle {
    var peddling = false
    
    func accelerate() {
        peddling = true
    }
    
    func stop() {
        peddling = false
    }
}

enum Direction {
    case left
    case right
}

protocol DirectionalVehicle {
    func accelerate()
    func stop()
    func turn(_ direction: Direction)
    func description() -> String
}

protocol OptionalDirectionVehicle {
    func turn()
    func turn(_ direction: Direction)
}

protocol VehicleProperties {
    var weight: Int { get }
    var name: String { get set }
}

protocol Account {
    var value: Double { get set }
    init(initialAmount: Double)
    init?(transferAccount: Account)
}

class BitcoinAccount: Account {
    var value: Double
    var accountName: String = ""
    required init(initialAmount: Double) {
        value = initialAmount
    }
    required init?(transferAccount: Account) {
        guard transferAccount.value > 0.0 else {
            return nil
        }
        value = transferAccount.value
    }
    convenience init(accountName: String) {
        self.init(initialAmount: 0)
        self.accountName = accountName
    }
}

var namedBitcoinAccount = BitcoinAccount(accountName: "BTC")
print(namedBitcoinAccount.value)
var bitcoinAccount: Account = BitcoinAccount(initialAmount: 25)
print(bitcoinAccount.value)
bitcoinAccount.value = -10
print(bitcoinAccount.value)
var cloneBitcoinAccount = BitcoinAccount(transferAccount: bitcoinAccount)


var accountType: Account.Type = BitcoinAccount.self
let account = accountType.init(initialAmount: 30.00)
let transferAccount = accountType.init(transferAccount: account)!

protocol WheeledVehicle: Vehicle {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get set }
}

struct Ferrari: WheeledVehicle {
    var numberOfWheels: Int
    var wheelSize: Double
    
    func accelerate() {}
    func stop() {}
}

// Minik Exercise
protocol Area {
    var area: Double { get }
}

struct Square: Area {
    let side: Double
    
    var area: Double {
        side * side
    }
}

struct Triangle: Area {
    var height: Double
    var base: Double
    
    var area: Double {
        height * base / 2
    }
}

struct Circle: Area {
    var radius: Double
    
    var area: Double {
        .pi * pow(radius, 2)
    }
}

let square = Square(side: 5)
let triangle = Triangle(height: 6, base: 4)
let circle = Circle(radius: 6)
let shapes: [Area] = [square, triangle, circle]
let areas = shapes.map{ $0.area }
print(areas)

class Bike: WheeledVehicle {
    let numberOfWheels = 2
    var wheelSize = 16.0
    
    var peddling = false
    var breaksApplied = false
    
    func accelerate() {
        peddling = true
        breaksApplied = false
    }
    
    func stop() {
        peddling = false
        breaksApplied = true
    }
}

protocol WeightCalculatable {
    associatedtype WeightType
    var weight: WeightType { get }
}

class HeavyThing: WeightCalculatable {
    //typealias WeightType = Int
    
    var weight: Int { 100 }
}

class LightThing: WeightCalculatable {
    //typealias WeightType = Double
    
    var weight: Double { 0.0025 }
}

//let weightedThing: WeightCalculatable = LightThing()

protocol Wheeled {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get set }
}

class Bike2: Vehicle, Wheeled {
    let numberOfWheels = 2
    var wheelSize = 16.0
    
    var peddling = false
    var breaksApplied = false
    
    func accelerate() {
        peddling = true
        breaksApplied = false
    }
    
    func stop() {
        peddling = false
        breaksApplied = true
    }
}

func roundAndRound(transportation: Vehicle & Wheeled) {
    transportation.stop()
    print("The brakes are being applied to \(transportation.numberOfWheels) wheels.")
}

roundAndRound(transportation: Bike2())

protocol Reflective {
    var typeName: String { get }
}

extension String: Reflective {
    var typeName: String {
        "I'm a String"
    }
}

let title = "Swift Apprentice!"
title.typeName

class AnotherBike: Wheeled {
    var peddling = false
    let numberOfWheels = 2
    var wheelSize = 16.0
}

extension AnotherBike: Vehicle {
    func accelerate() {
        peddling = true
    }
    
    func stop() {
        peddling = false
    }
}

protocol Named {
    var name: String { get set }
}

class ClassyName: Named {
    var name: String
    init(name: String) {
        self.name = name
    }
}

struct StructyName: Named {
    var name: String
}

var named: Named = ClassyName(name: "Classy")
var copy = named

named.name = "Still Classy"
named.name
copy.name

named = StructyName(name: "Structy")
copy = named
named.name = "Still Structy?"
named.name
copy.name

protocol Named2: AnyObject {
    var name: String { get set }
}

let a = 5
let b = 5

a == b

let swiftA = "Swift"
let swiftB = "Swift"

swiftA == swiftB

class Record {
    
    var wins: Int
    var losses: Int
    
    init(wins: Int, losses: Int) {
        self.wins = wins
        self.losses = losses
    }
}

let recordA = Record(wins: 10, losses: 5)
let recordB = Record(wins: 10, losses: 5)

recordA == recordB

//protocol Equatable {
//    static func ==(lhs: Self, rhs: Self) -> Bool
//}

extension Record: Equatable {
    static func ==(lhs: Record ,rhs: Record) -> Bool {
        lhs.wins == rhs.wins &&
        lhs.losses == rhs.losses
    }
}

//protocol Comparable: Equatable {
//    static func <(lhs: Self, rhs: Self) -> Bool
//    static func <=(lhs: Self, rhs: Self) -> Bool
//    static func >=(lhs: Self, rhs: Self) -> Bool
//    static func >(lhs: Self, rhs: Self) -> Bool
//}

extension Record: Comparable {
    static func <(lhs: Record, rhs: Record) -> Bool {
        if lhs.wins == rhs.wins {
            return lhs.losses > rhs.losses
        }
        return lhs.wins < rhs.wins
    }
}

let teamA = Record(wins: 14, losses: 11)
let teamB = Record(wins: 23, losses: 8)
let teamC = Record(wins: 23, losses: 9)
var leagueRecords = [teamA, teamB, teamC]

leagueRecords.sort()
leagueRecords.max()
leagueRecords.min()
leagueRecords.starts(with: [teamA, teamC])
leagueRecords.contains(teamA)

class Student {
    let email: String
    let firstName: String
    let lastName: String
    
    init(email: String, firstName: String, lastName: String) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
    }
}

extension Student: Hashable {
    static func ==(lhs: Student, rhs: Student) -> Bool {
        lhs.email == rhs.email &&
        lhs.firstName == rhs.firstName &&
        lhs.lastName == rhs.lastName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(email)
        hasher.combine(firstName)
        hasher.combine(lastName)
    }
}

let cihan = Student(email: "cihan.chn@gmail.com",
                   firstName: "Cihan",
                   lastName: "Öztürk")
let lockerMap = [cihan: "14B"]
print(lockerMap[cihan]!)

extension Student: Identifiable {
    var id: String {
        email
    }
}

print(cihan)

//protocol CustomStringConvertible {
//    var description: String { get }
//}

extension Student: CustomStringConvertible {
    var description: String {
        "\(firstName) \(lastName)"
    }
}

print(cihan)

extension Student: CustomDebugStringConvertible {
    var debugDescription: String {
        "\(firstName) \(lastName)"
    }
}

debugPrint(cihan)

// MARK: - Challenge
protocol Animal: Feedable {}

protocol Feedable {
    func feed()
}

protocol Cageable: Cleanable {
    func putInCage()
}

protocol Walkable {
    func walk()
}

protocol Tankable: Cleanable {
    func putInTank()
}

protocol Cleanable {
    func clean()
}

struct Dog: Animal, Walkable {
    func feed() {
        print("Dogs needed to be fed.")
    }
    
    func walk() {
        print("Dogs need a walk.")
    }
}

struct Cat: Animal, Cleanable{
    func feed() {
        print("Cats need food all the time.")
    }
    
    func clean() {
        print("Clean litter box")
    }
}

struct Fish: Animal, Tankable {
    func feed() {
        print("Fish need more food.")
    }
    
    func putInTank() {
        print("Fish needed to be in tank in order to survive.")
    }
    
    func clean() {
        print("Tanks need cleaning.")
    }
}

struct Bird: Animal, Cageable {
    func feed() {
        print("Birds needed to be fed.")
    }
    
    func putInCage() {
        print("Animals that needed to be caged.")
    }
    
    func clean() {
        print("Those cages need cleaning.")
    }
}

let bird = Bird()
let dog = Dog()
let cat = Cat()
let fish = Fish()

var fed: [Feedable] = [bird, dog, cat, fish]
var caged: [Cageable] = [bird]
var tanked: [Tankable] = [fish]
var walked: [Walkable] = [dog]
var cleaned: [Cleanable] = [cat]

for feedable in fed {
    feedable.feed()
}

for cageable in caged {
    cageable.putInCage()
}

for tankable in tanked {
    tankable.putInTank()
}

for walkable in walked {
    walkable.walk()
}

for cleanable in cleaned {
    cleanable.clean()
}
