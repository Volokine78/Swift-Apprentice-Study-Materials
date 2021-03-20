import UIKit

var str = "Hello, playground"

let string = "Matt"
for char in string {
    print(char)
}

let stringLength = string.count

let cafeNormal = "café"
let cafeCombining = "cafe\u{0301}"

cafeNormal.count
cafeCombining.count

cafeNormal.unicodeScalars.count
cafeCombining.unicodeScalars.count

for codePoint in "👨‍👨‍👧‍👧".unicodeScalars {
    print(codePoint.value)
}

print("👨‍👨‍👧‍👧".unicodeScalars.count)

let firstIndex = cafeCombining.startIndex
print(firstIndex)

let firstChar = cafeCombining[firstIndex]
let firstChar1 = cafeCombining[cafeCombining.startIndex]
print(firstChar)

let lastIndex = cafeCombining.index(before: cafeCombining.endIndex)
let lastChar = cafeCombining[lastIndex]
print(lastChar)

let fourthIndex = cafeCombining.index(cafeCombining.startIndex, offsetBy: 3)
let fourthChar = cafeCombining[fourthIndex]
print(fourthChar)

fourthChar.unicodeScalars.count
fourthChar.unicodeScalars.forEach { codePoint in
    print(codePoint.value)
}

let equal = cafeNormal == cafeCombining

let name = "Matt"
let backwardsName = name.reversed()
print(backwardsName)
for char in name.reversed() {
    print(char, terminator: "")
}
print("")

let reversedStirng = name.reversed().reduce("") {
    $0 + "\($1)"
}

let secondCharIndex = backwardsName.index(backwardsName.startIndex, offsetBy: 1)
let secondChar = backwardsName[secondCharIndex]
print(secondChar)

let backwardsNameString = String(backwardsName)
print(backwardsNameString)

let raw1 = #"Raw "No Escaping" \(no interpolation!). Use all the \ you want!"#
print(raw1)

let raw2 = ##"Aren't we "# clever"##
print(raw2)

let can = "can do that too"
let raw3 = #"Yes we \#(can)!"#
print(raw3)

let fullName = "Matt Galloway"
let spaceIndex = fullName.firstIndex(of: " ")!
let firstName = fullName[fullName.startIndex..<spaceIndex]
print(firstName)

let firstName1 = fullName[..<spaceIndex]
print(firstName1)
let lastName = fullName[fullName.index(after: spaceIndex)...]
print(lastName)

let lastNameString = String(lastName)

let singleCharacter: Character = "x"
singleCharacter.isASCII
let singleCharacter1: Character = "🥳"
singleCharacter1.isASCII

let space: Character = " "
space.isWhitespace

let hexDigit: Character = "a"
hexDigit.isHexDigit

let thaiNine: Character = "๙"
print(thaiNine.wholeNumberValue!)

let char = "\u{00bd}"
for i in char.utf8 {
    print(i)
}

let characters = "+\u{00bd}\u{21e8}\u{1f643}"
for i in characters.utf8 {
    print("\(i) : \(String(i, radix: 2))")
}

for i in characters.utf16 {
    print("\(i) : \(String(i, radix: 2))")
}

let arrowIndex = characters.firstIndex(of: "\u{21e8}")!
characters[arrowIndex]

if let unicodeScalarsIndex = arrowIndex.samePosition(in: characters.unicodeScalars) {
    characters.unicodeScalars[unicodeScalarsIndex]
}

if let utf8Index = arrowIndex.samePosition(in: characters.utf8) {
    characters.utf8[utf8Index]
}

if let utf16Index = arrowIndex.samePosition(in: characters.utf16) {
    characters.utf16[utf16Index]
}

// MARK: - Challenges 1
func countOfCharactersInString (for string: String) {
    var occurences: [Character: Int] = [:]
    for character in string {
        occurences[character, default: 0] += 1
    }
    let sortedKeys = occurences.keys.sorted {
        occurences[$0]! > occurences[$1]!
    }
    
    let max = occurences[sortedKeys.first!]!
    
    for key in sortedKeys {
        let value = occurences[key]!
        let widthOfHashes = (value * 10) / max
        let hashes = String(repeating: "#", count: widthOfHashes)
        print("\(key) : \(hashes) \(value)")
    }
}
countOfCharactersInString(for: "Mithrandir")

func printCharacterCount(for string: String) {
  guard string.count > 0 else { return }

  var counts: [Character: Int] = [:]

  for i in string {
    counts[i, default: 0] += 1
  }

  let sortedKeys = counts.keys.sorted { counts[$0]! > counts[$1]! }

  let max = counts[sortedKeys.first!]!

  for key in sortedKeys {
    let value = counts[key]!
    let widthOfHashes = (value * 20) / max
    let hashes = String(repeating: "#", count: widthOfHashes)
    print("\(key) : \(hashes) \(value)")
  }
}

printCharacterCount(for: "The quick brown fox jumps over the lazy dog")

//MARK: - Challenge 2
func wordCount(in string: String) -> Int {
    var count = 0
    let trimmedString = string.trimmingCharacters(in: CharacterSet(charactersIn: "1 2356"))
    for character in trimmedString {
        if !character.isLetter {
            count += 1
        }
    }
    return count + 1
}
wordCount(in: "1 2 35 Tolga minik sofi 53 6")

let space1: Character = " "
space1.isLetter

func numberOfWords(in sentence: String) -> Int {
    var count = 0
    var inWord = false
    
    for character in sentence {
        if character == " " {
            if inWord {
                count += 1
            }
            inWord = false
        } else {
            inWord = true
        }
    }
    if inWord {
        count += 1
    }
    return count
}

let wordCount = numberOfWords(in: "The quick brown fox jumps over the lazy dog")
print(wordCount)

// MARK: - Challenge 3
func formatted(name: String) -> String? {
    guard let commaIndex = name.firstIndex(of: ",") else {
        return nil
    }
    
    let lastName = name[name.startIndex..<commaIndex]
    let firstName = name[name.index(after: commaIndex)...]

    return String(firstName + " " + lastName)
}
if let formattedName = formatted(name: "Pirtürk,Tolga") {
    print(formattedName)
}

func sanitized(name: String) -> String? {
    guard let indexOfComma = name.firstIndex(of: ",") else {
        return nil
    }
    let lastNameSubstring = name[..<indexOfComma]
    let firstNameSubstring = name[name.index(after: indexOfComma)...].dropFirst()
    
    return firstNameSubstring + " " + lastNameSubstring
}
if let sanitizedName = sanitized(name: "Galloway, Matt") {
    print(sanitizedName)
}

// MARK: - Challenge 4
func components(_ string: String, delimiter: Character) -> [String] {
    var stringArray: [String] = []
    var lastWordIndex = string.startIndex
    
    for i in string.indices {
        if string[i] == delimiter {
            let subString = string[lastWordIndex..<i]
            stringArray.append(String(subString))
            lastWordIndex = string.index(after: i)
        }
    }
    let subString = string[lastWordIndex..<string.endIndex]
    stringArray.append(String(subString))
    
    return stringArray
}

let cat = components("Minik,Boncuk,Sofi,Oscar,Zeytin", delimiter: ",")
print(cat)

let cat1 = "Minik,Boncuk,Sofi,Oscar,Zeytin".components(separatedBy: ",")
print(cat1)

// MARK: - Challenge 5
func wordReverser(_ string: String) -> String {
    var reversedWords = ""
    var lastCharacterIndex = string.startIndex
    
    for i in string.indices {
        if string[i] == " " {
            let subString = string[lastCharacterIndex..<i]
            reversedWords += subString.reversed() + " "
            lastCharacterIndex = string.index(after: i)
        }
    }
    let subString = string[lastCharacterIndex..<string.endIndex]
    reversedWords += subString.reversed()
    
    return reversedWords
}

let happyCat = wordReverser("Minik yeni mamasını çok sevdi.")
print(happyCat)
