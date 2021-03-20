import UIKit

var str = "Hello, playground"

let evenNumbers = [2, 4, 6, 8]
var subscribers: [String] = []
let allZeros = Array(repeating: 0, count: 5)
let vowels = ["A", "E", "I", "O", "U"]

var players = ["Alice", "Bob", "Cindy", "Dan"]
print(players.isEmpty)

if players.count < 2 {
    print("We need at least two players!")
} else {
    print("Let's start!")
}

var currentPlayer = players.first
print(currentPlayer as Any)
print(players.last as Any)

currentPlayer = players.min()
print(currentPlayer as Any)

print([2, 3, 1].first as Any)
print([2, 3, 1].min() as Any)

if let currentPlayer = currentPlayer {
    print("will start", "Tolga", currentPlayer, 5)
}

var firstPlayer = players[0]
print("First player is \(firstPlayer)")

let upcomingPlayerSlice = players[1...2]
print(upcomingPlayerSlice[1...2])
print(upcomingPlayerSlice[1], ",", upcomingPlayerSlice[2])

let upcomingPlayersArray = Array(players[1...2])
print(upcomingPlayersArray[0], upcomingPlayersArray[1])

func isEliminated(player: String) -> Bool {
    !players.contains(player)
}
print(isEliminated(player: "Bob"))
print(isEliminated(player: "Matt"))
let players1_3 = players[1...3]
players[1...3].contains("Bob")
players[1...3].contains("Alice")

players.append("Eli")
players += ["Gina"]
print(players)

players.insert("Frank", at: 5)

var removedPlayer = players.removeLast()
print("\(removedPlayer) was removed")
print(players)

removedPlayer = players.remove(at: 2)
print("\(removedPlayer) was removed")
print(players)

let indexOfBob = players.firstIndex(of: "Bob")
print(indexOfBob as Any)

if let i = players.firstIndex(of: "Bob") {
    players[i] = "Boby"
}
print(players)

// Mini Exercise
let indexofDan = players.firstIndex(of: "Dan")
print(indexofDan as Any)

print(players)
players[4] = "Franklin"
print(players)

players[0...1] = ["Donna", "Craig", "Brian", "Anna"]
print(players)

let playerAnna = players.remove(at: 3)
players.insert(playerAnna, at: 0)
print(players)

players.swapAt(1, 3)
print(players)

players.sorted()
print(players)
let sortedPlayers = players.sorted()
print(sortedPlayers)
print(players.sorted())
players.sort()
print(players)

let scores = [2, 2, 8, 6, 1, 2, 1]
for player in players {
    print(player)
}

for (index, player) in players.enumerated() {
    print("\(index + 1). \(player)")
}

func sumOfElements(in array: [Int]) -> Int {
    var sum = 0
    for number in array {
        sum += number
    }
    return sum
}
print(sumOfElements(in: scores))

// Mini Exercise
for (index, player) in players.enumerated() {
    print("\(index + 1). \(player) - \(scores[index])")
}
for (i, player) in players.enumerated() {
    print(player, "\(scores[i])")
}

var namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
print(namesAndScores)

namesAndScores = [:]
var pairs: [String: Int] = [:]
pairs.reserveCapacity(20)

namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
print(namesAndScores["Anna"]!)
namesAndScores["Greg"]

namesAndScores.isEmpty
namesAndScores.count

var bobData: [String: String?] = [
    "name": "Bob",
    "profession": "Card Player",
    "Country": "USA"
]

var serdarData = [
    "name": "Serdar",
    "city": "Dublin",
    "state": "IRL"
]

bobData.updateValue("CA", forKey: "state")
print(bobData)
bobData["city"] = "San Francisco"
print(bobData)

// Mini Exercise
func playerCityAndState(player: [String: String?]) {
    print(player["city"]!! + "," + player["state"]!!)
}
playerCityAndState(player: bobData)

func printLocation(ofPlayer player: [String: String?]) {
    if let city = player["city"]!, let state = player["state"]! {
        print("Player lives in \(city), \(state)")
    }
}
printLocation(ofPlayer: bobData)

//bobData.updateValue("Bobby", forKey: "name")
if let oldName = bobData.updateValue("Bobby", forKey: "name"){
    print("The old name of \(oldName!) is replaced by new one.")
}
print(bobData)

bobData["profession"] = "Mailman"
print(bobData)

bobData.removeValue(forKey: "state")
print(bobData)

bobData["city"] = nil
print(bobData)

//bobData.updateValue(nil , forKey: "Country") value string ise nil nasıl yapacağız ? value type String optional ise nil olabilir

for (player, score) in namesAndScores {
    print("\(player) \t- \(score)")
}

for player in namesAndScores.keys {
    print("\(player), ", terminator: "")
}
print("")

let setOne: Set<Int> = [1]
var explicitSet: Set<Int> = [1, 2, 3, 1]
var someSet = Set([1, 2, 3, 1])
print(someSet)
print(someSet.contains(1))
print(someSet.contains(4))

someSet.insert(5)
print(someSet)
someSet.insert(1)
print(someSet)

let removedElement = someSet.remove(1)
print(removedElement!)
print(someSet)
someSet.remove(1)

// MARK: - Challenge 1
let array1 = [Int]()
//let array2 = []
let array3: [String] = []

let array4 = [1, 2, 3]
print(array4[0])
//print(array4[5])
array4[1...2]
//array4[0] = 4
//array4.append(4)

var array5 = [1, 2, 3]
array5[0] = array5[1]
array5[0...1] = [4, 5]
//array5[0] = "Six"
//array5 += 6
for item in array5 { print(item) }

// MARK: - Challenge 2
var array = [0, 1, 2, 2, 3, 4]

func removingOnce(_ item: Int, from array: [Int]) -> [Int] {
    var result = array
    if let index = array.firstIndex(of: item) {
        result.remove(at: index)
    }
    return result
}
print(removingOnce(2, from: array))

// MARK: - Challenge 3
var array6 = [0, 1, 2, 2, 3, 3, 3, 4]

func removing(_ item: Int, from array: [Int]) -> [Int] {
    var result = array
    for willRemoveItem in array {
        if willRemoveItem == item {
            if let index = array.firstIndex(of: item) {
                result.remove(at: index)
            }
        }
    }
    return result
}
print(removing(3, from: array6))

func removing1(_ item: Int, from array: [Int]) -> [Int] {
    var newArray: [Int] = []
    for candidateItem in array {
        if candidateItem != item{
            newArray.append(candidateItem)
        }
    }
    return newArray
}
print(removing1(2, from: array6))

// MARK: - Challenge 4
var array7 = [0, 1, 2, 3, 4, 5, 6]

func reversed(_ array: [Int]) -> [Int] {
    var i = 0
    var j = array.count
    var reversedArray = array
    if j % 2 == 0 {
        print(j)
        for _ in reversedArray where i <= (j / 2) {
            print(i, j)
            reversedArray.swapAt(i, j - 1)
            i += 1
            j -= 1
        }
    } else {
        for _ in reversedArray where i <= ((j - 1) / 2) {
            reversedArray.swapAt(i, j - 1)
            i += 1
            j -= 1
        }
    }
    return reversedArray
}
print(reversed(array7))

func reversed1(_ array: [Int]) -> [Int] {
    var newArray: [Int] = []
    for item in array {
        newArray.insert(item, at: 0)
    }
    return newArray
}
print(reversed1(array7))

// MARK: - Challenge 5
var array8 = [0, 3, 5, 7, 9, 10]

func middle(_ array: [Int]) -> Int? {
    if array.isEmpty {
        return nil
    }
    if array.count % 2 == 0 {
        return array[array.count/2 - 1]
    } else {
        return array[array.count/2]
    }
}
print(middle(array8) as Any)

func middle1(_ array: [Int]) -> Int? {
    guard !array.isEmpty else {
        return nil
    }
    if array.count % 2 == 0 {
        return array[array.count/2 - 1]
    } else {
        return array[array.count/2]
    }
}
print(middle1(array8)!)

// MARK: - Challenge 6
var array9 = [0, 4, 5, 6, 12, 15]

func minMax(of numbers: [Int]) -> (min: Int, max: Int)? {
    if numbers.isEmpty {
        return nil
    }
    var min = 4294967295
    var max = 0
    for i in numbers {
        if i < min {
            min = i
        }
        if i > max {
            max = i
        }
    }
    return (min, max)
}
print(minMax(of: array9)!)

func minMax1(of numbers: [Int]) -> (min: Int, max: Int)? {
    if numbers .isEmpty {
        return nil
    }
    var min = numbers[0]
    var max = numbers[0]
    for number in numbers {
        if number < min {
            min = number
        }
        if number > max {
            max = number
        }
    }
    return (min, max)
}
print(minMax1(of: array9)!)

// MARK: - Challenge 7
//let dict1: [Int, Int] = [:]
//let dict2 = [:]
let dict3: [Int: Int] = [:]
let dict4 = ["One": 1, "Two": 2, "Three": 3]
//dict4[1]
dict4["One"]
//dict4["Zero"] = 0
//dict4[0] = "Zero"
var dict5 = ["NY": "New York", "CA": "California"]
dict5["NY"]
dict5["WA"] = "Washington"
dict5["CA"] = nil

// MARK: - Challenge 8
let dict6 = ["NY": "New York", "CA": "California", "AMS": "Amsterdam", "DB": "Dublin"]

func printLongStateNames(for dictionary: [String: String]) {
    for (_, value) in dictionary {
        if value.count > 8 {
            print(value)
        }
    }
}
print(printLongStateNames(for: dict6))

// MARK: - Challenge 9
let dict7 = ["NY": "New York", "CA": "California", "AMS": "Amsterdam", "DB": "Dublin"]
let dict8 = ["NY": "New York", "CA": "California", "PRS": "Paris", "LDN": "London"]

func merging(_ dict1: [String: String], with dict2: [String: String]) -> [String: String] {
    var mergedDict: [String: String] = [:]
    for (key, value) in dict1 {
        mergedDict[key] = value
    }
    for (key, value) in dict2 {
        mergedDict[key] = value
    }
    return mergedDict
}
print(merging(dict7, with: dict8))

func merging1(_ dict1: [String: String], with dict2: [String: String]) -> [String: String] {
    var newDictionary = dict1
    for (key, value) in dict2 {
        newDictionary[key] = value
    }
    return newDictionary
}
print(merging1(dict7, with: dict8))

// MARK: - Challenge 10
let gandalf = "Mithrandir"

func occurrencesOfCharacters(in text: String) -> [Character: Int] {
    var dictionary: [Character: Int] = [:]
    for character in text {
        if let count = dictionary[character] {
            dictionary[character] = count + 1
        } else {
            dictionary[character] = 1
        }
    }
    return dictionary
}
print(occurrencesOfCharacters(in: gandalf))

func occurrencesOfCharacters1(in text: String) -> [Character: Int] {
    var occurrences: [Character: Int] = [:]
    for character in text {
        occurrences[character, default: 0] += 1
    }
    return occurrences
}
print(occurrencesOfCharacters1(in: gandalf))

// MARK: - Challenge 11
let dict9 = ["GND": 6, "SRM": 8, "RDGT": 7, "WZRD": 9]

func isInvertible(_ dictionary: [String: Int]) -> Bool {
    var valueSet: Set<Int> = []
    for value in dictionary.values {
        if valueSet.contains(value) {
            return false
        }
        valueSet.insert(value)
    }
    return true
}
print(isInvertible(dict9))

func isInvertible1(_ dictionary: [String: Int]) -> Bool {
    var valueSet: Set<Int> = []
    for value in dictionary.values {
        valueSet.insert(value)
    }
    return dictionary.values.count == valueSet.count
}
print(isInvertible1(dict9))

// MARK: - Challenge 12
var nameTitleLookup: [String: String?] = ["Mary": "Engineer", "Patrick": "Intern", "Ray": "Hacker"]

nameTitleLookup["Ray"] = nil // or nameTitleLookup.removeValue(forKey: "Ray")
nameTitleLookup.updateValue(nil, forKey: "Patrick")
print(nameTitleLookup)

