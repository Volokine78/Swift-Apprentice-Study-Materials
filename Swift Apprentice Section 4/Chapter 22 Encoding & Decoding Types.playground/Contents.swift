import UIKit
import XCTest

var str = "Hello, playground"

struct Employee {
    var name: String
    var id: Int
    var favoriteToy: Toy?
    
    enum CodingKeys: String, CodingKey {
        case id = "employeeId"
        case name
        case gift
    }
}

struct Toy: Codable {
    var name: String
}

extension Employee: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(favoriteToy?.name, forKey: .gift)
    }
}

extension Employee: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        id = try container.decode(Int.self, forKey: .id)
        if let gift = try container.decodeIfPresent(String.self, forKey: .gift) {
            favoriteToy = Toy(name: gift)
        }
    }
}

class EncoderDecoderTests: XCTestCase {
    var jsonEncoder: JSONEncoder!
    var jsonDecoder: JSONDecoder!
    var toy1: Toy!
    var employee1: Employee!
    
    override func setUp() {
        super.setUp()
        jsonEncoder = JSONEncoder()
        jsonDecoder = JSONDecoder()
        toy1 = Toy(name: "Teddy Bear")
        employee1 = Employee(name: "John Nash", id: 7, favoriteToy: toy1)
    }
    
    func testEncoder() {
        let jsonData = try? jsonEncoder.encode(employee1)
        XCTAssertNotNil(jsonData, "Encoding failed")
        
        let jsonString = String(data: jsonData!, encoding: .utf8)!
        XCTAssertEqual(jsonString, "{\"name\":\"John Nash\",\"gift\":\"Teddy Bear\",\"employeeId\":7}")
    }
    
    func testDecoder() {
        let jsonData = try! jsonEncoder.encode(employee1)
        let employee2 = try? jsonDecoder.decode(Employee.self, from: jsonData)
        XCTAssertNotNil(employee2)
        
        XCTAssertEqual(employee1.name, employee2!.name)
        XCTAssertEqual(employee1.id, employee2!.id)
        XCTAssertEqual(employee1.favoriteToy?.name, employee2!.favoriteToy?.name)
    }
}

let toy1 = Toy(name: "Teddy Bear")
let employee1 = Employee(name: "John Nash", id: 7, favoriteToy: toy1)
let employee4 = Employee(name: "Steve Nash", id: 8)

let jsonEncoder = JSONEncoder()
let jsonData = try jsonEncoder.encode(employee1)
let jsonData2 = try JSONEncoder().encode(employee1)
let jsonData3 = try JSONEncoder().encode(employee4)
print(jsonData.base64EncodedString())
print(jsonData3)

let jsonString = String(data: jsonData, encoding: .utf8)!
let jsonString2 = String(data: jsonData3, encoding: .utf8)!
print(jsonString)
print(jsonString2)

let jsonDecoder = JSONDecoder()
let employee2 = try jsonDecoder.decode(Employee.self, from: jsonData)
let employee3 = try JSONDecoder().decode(Employee.self, from: jsonData2)
let employee5 = try JSONDecoder().decode(Employee.self, from: jsonData3)
print(employee2)
print(employee3)
print(employee5)
print("\n")
EncoderDecoderTests.defaultTestSuite.run()

// MARK: - Challenge 1, 2, 3, 4
struct Spaceship: Encodable {
    var name: String
    var crew: [CrewMember]
}

struct CrewMember: Codable {
    var name: String
    var race: String
}

extension Spaceship {
    enum CodingKeys: String, CodingKey {
        case name = "spaceship_name"
        case crew
    }
}

extension Spaceship {
    enum CrewKeys: String, CodingKey {
        case captain
        case officer
    }
}

extension Spaceship: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        let crewValues = try decoder.container(keyedBy: CrewKeys.self)
        let captain = try crewValues.decodeIfPresent(CrewMember.self, forKey: .captain)
        let officer = try crewValues.decodeIfPresent(CrewMember.self, forKey: .officer)
        crew = [captain, officer].compactMap { $0 }
    }
}

let incoming = "{\"spaceship_name\": \"USS Enterprise\", \"captain\":{\"name\":\"Spock\", \"race\":\"Human\"}, \"officer\":{\"name\": \"Worf\", \"race\":\"Klingon\"}}"

let newSpaceship = try JSONDecoder().decode(Spaceship.self, from: incoming.data(using: .utf8)!)
print(newSpaceship)

var klingonSpaceship = Spaceship(name: "IKS NEGH’VAR", crew: [])
let klingonMessage = try PropertyListEncoder().encode(klingonSpaceship)

let decodedMessage = try PropertyListDecoder().decode(Spaceship.self, from: klingonMessage)
print(decodedMessage)
