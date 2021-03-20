import UIKit

var str = "Hello, playground"

extension String {
    func shout() {
        print(uppercased())
    }
}

"Swift is pretty cool".shout()

protocol TeamRecord {
    var wins: Int { get }
    var losses: Int { get }
    var winningPercentage: Double { get }
}

extension TeamRecord {
    var gamesPlayed: Int {
        wins + losses
    }
}

extension TeamRecord {
    var winningPercentage: Double {
        Double(wins) / Double(wins + losses)
    }
}

struct BaseballRecord: TeamRecord {
    var wins: Int
    var losses: Int
    
    var winningPercentage: Double {
        Double(wins) / Double(losses + wins)
    }
}

let sanFranciscoSwifts = BaseballRecord(wins: 10, losses: 5)
sanFranciscoSwifts.gamesPlayed
sanFranciscoSwifts.winningPercentage

struct BasketballRecord: TeamRecord {
    var wins: Int
    var losses: Int
    let seasonLength = 82
}

let minneapolisFunctors = BasketballRecord(wins: 60, losses: 22)
minneapolisFunctors.winningPercentage

struct HockeyRecord: TeamRecord {
    var wins: Int
    var losses: Int
    var ties: Int
    
    var winningPercentage: Double {
        Double(wins) / Double(wins + losses + ties)
    }
}

let chicagoOptionals = BasketballRecord(wins: 10, losses: 6)
let phoenixStridables = HockeyRecord(wins: 8, losses: 7, ties: 1)

chicagoOptionals.winningPercentage
phoenixStridables.winningPercentage

// Minik Exercise 1
struct MyStruct: CustomStringConvertible {}

extension CustomStringConvertible {
    var description: String {
        "Remember to implement CustomStringConvertible!"
    }
}

print(MyStruct())
// End of Minik Exercise 1

protocol Winloss {
    var wins: Int { get }
    var losses: Int { get }
}

extension Winloss {
    var winningPercentage: Double {
        Double(wins) / Double(wins + losses)
    }
}

struct CricketRecord: Winloss {
    var wins: Int
    var losses: Int
    var draws: Int
    
    var winningPercentage: Double {
        Double(wins) / Double(wins + losses + draws)
    }
}

let miamiTuples = CricketRecord(wins: 8, losses: 7, draws: 1)
let winLoss: Winloss = miamiTuples

miamiTuples.winningPercentage
winLoss.winningPercentage

protocol PostSeasonEligible {
    var minimumWinsForPlayoffs: Int { get }
}

extension TeamRecord where Self: PostSeasonEligible {
    var isPlayoffEligible: Bool {
        wins > minimumWinsForPlayoffs
    }
}

protocol Tieable {
    var ties: Int { get }
}

extension TeamRecord where Self: Tieable {
    var winningPercentage: Double {
        Double(wins) / Double(wins + losses + ties)
    }
}

struct RugbyRecord: TeamRecord, Tieable {
    var wins: Int
    var losses: Int
    var ties: Int
}

let rugbyRecord = RugbyRecord(wins: 8, losses: 7, ties: 1)
rugbyRecord.winningPercentage

// Minik Exercise 2
extension CustomStringConvertible where Self: TeamRecord {
    var description: String {
        "\(wins) - \(losses)"
    }
}

struct SoccerRecord: TeamRecord {
    var wins: Int
    var losses: Int
}

extension SoccerRecord: CustomStringConvertible {}

let soccerRecord = SoccerRecord(wins: 10, losses: 5)
print(soccerRecord.description)
print(SoccerRecord(wins: 20, losses: 15))
// End of Minik Exercise 2

class TeamRecordBase {
    var wins = 0
    var losses = 0
    
    var winningPercentage: Double {
        Double(wins) / Double(wins + losses)
    }
}

//struct BaseballRecord: TeamRecordBase {}

class HockeyRecordClass: TeamRecordBase {
    var ties = 0
    
    override var winningPercentage: Double {
        Double(wins) / Double(wins + losses + ties)
    }
}

class TieableRecordBase: TeamRecordBase {
    var ties = 0
    
    override var winningPercentage: Double {
        Double(wins) / Double(wins + losses + ties)
    }
}

class HockeyRecordClass2: TieableRecordBase {}
class CricketRecordClass: TieableRecordBase {}

extension TieableRecordBase {
    var totalPoints: Int {
        (2 * wins) + (1 * ties)
    }
}

protocol TieableRecord {
    var ties: Int { get }
}

protocol DivisionalRecord {
    var divisionalWins: Int { get }
    var divisionalLosses: Int { get }
}

protocol ScorableRecord {
    var totalPoints: Int { get }
}

extension ScorableRecord where Self: TieableRecord & TeamRecord {
    var totalPoints: Int {
        (2 * wins) + (1 * ties)
    }
}

struct NewHockeyRecord: TeamRecord, TieableRecord, DivisionalRecord,
                        CustomStringConvertible, Equatable {
    var wins: Int
    var losses: Int
    var ties: Int
    var divisionalWins: Int
    var divisionalLosses: Int
    
    var description: String {
        "\(wins) - \(losses) - \(ties)"
    }
}

// MARK: - Challenge 1
protocol Item: CustomStringConvertible {
    var name: String { get }
    var clearance: Bool { get }
    var msrp: Double { get }
    var totalPrice: Double { get }
}

protocol SalesTax: Item{
    var tax: Double { get }
}

protocol Discounted: Item {
    var discountedPrice: Double { get }
}

extension Item {
    var description: String {
        name
    }
}
    
extension Item {
    var totalPrice: Double {
        msrp
    }
}
    
extension Item where Self: SalesTax {
    var totalPrice: Double {
        msrp * (1 + tax)
    }
}

extension Item where Self: Discounted {
    var totalPrice: Double {
        discountedPrice
    }
}

extension Item where Self: SalesTax & Discounted {
    var totalPrice: Double {
        discountedPrice + tax
    }
}

//extension Item where Self.clearance == true {
//            var totalPrice: Double {
//                msrp * 0.5
//            }
//        }

struct FoodItems: SalesTax, Discounted {
    var name: String
    var clearance: Bool
    var msrp: Double
    let expirationDate: (mounth: Int, year: Int)
    
    let tax: Double = 0.075

    var discountedPrice: Double {
        msrp * (clearance ? 0.5 : 1.0)
    }
    
    var description: String {
        "\(name) - \(expirationDate.mounth).\(expirationDate.year)"
    }
}

struct Clothes: Discounted {
    var name: String
    var clearance: Bool
    var msrp: Double
    
    var discountedPrice: Double {
        msrp * (clearance ? 0.75 : 1.0)
    }
}

struct Electronics: SalesTax, Discounted {
    var name: String
    var clearance: Bool
    var msrp: Double
    
    let tax: Double = 0.075
    
    var discountedPrice: Double {
        msrp * (clearance ? 0.95 : 1.0)
    }
}

FoodItems(name: "bread", clearance: true, msrp: 2.99, expirationDate: (11, 2021))
FoodItems(name: "bread", clearance: true, msrp: 2.99, expirationDate: (11, 2021)).totalPrice
Electronics(name: "PlayStation 5", clearance: true, msrp: 400.00)
Electronics(name: "PlayStation 5", clearance: true, msrp: 400.00).discountedPrice
Clothes(name: "shirt", clearance: true, msrp: 119.99)
Clothes(name: "shirt", clearance: true, msrp: 119.99).msrp

// MARK: - Challenge 2
extension Sequence where Element: Numeric {
    func double() -> Array<Element> {
        self.map { $0 * 2 }                // Bu durumda self yazılmadığında da çalışır.
    }
}

[10, 11, 12, 13, 14, 15].double()
[1.1, 1.2, 1.3, 1.4, 1.5].double()
