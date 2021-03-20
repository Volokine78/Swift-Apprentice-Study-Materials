import UIKit
import Foundation
import XCTest

var str = "Hello, playground"

//let account = BasicAccount()
//
//account.deposit(amount: 10.00)
//account.withdraw(amount: 5.00)
//
////account.balance = 1000000.00
//
let johnChecking = CheckingAccount()
johnChecking.deposit(amount: 300.00)
//
//let check = johnChecking.writeCheck(amount: 200.00)!
//
//let janeChecking = CheckingAccount()
//janeChecking.deposit(check)
//janeChecking.balance
//
//janeChecking.deposit(check)
//janeChecking.balance

class SavingsAccount: BasicAccount {
    var interestRate: Double
    @available(*, deprecated, message: "Use init(interestRate:pin:) instead")
    
    init(interestRate: Double) {
        self.interestRate = interestRate
    }
    
//    init(interestRate: Double, pin: Int) {
//        self.interestRate = interestRate
//        self.pin = pin
//    }
      
    @available(*, deprecated, message: "Use processInterest(pin:) instead")
    
    func processInterest() {
        let interest = balance * interestRate
        deposit(amount: interest)
    }
    
//  func processInterest(pin: Int) {
//      if pin == self.pin {
//          let interest = balance * interestRate
//          deposit(amount: interest)
//      }
//  }

    
//    override func deposit(amount: Dollars) {
//        super.deposit(amount: 1_000_000.00)
//    }
}

let john = Person(first: "John", last: "Malkovich")
john.first
john.last
john.fullName

class Doctor: ClassyPerson {
    override var fullName: String {
        "Dr. \(super.fullName)"
    }
}

let house = Doctor(first: "Gregory", last: "House")
house.fullName

let sAccount = SavingsAccount(interestRate: 1.04)
sAccount.processInterest()

func createAccount() -> some Account {
    CheckingAccount()
}

class BankingTests: XCTestCase {
    var checkingAccount: CheckingAccount!
    
    override func setUp() {
        super.setUp()
        checkingAccount = createCheckingAccount()
    }
    
    override func tearDown() {
        checkingAccount.withdraw(amount: checkingAccount.balance)
        super.tearDown()
    }
    
    func createCheckingAccount() -> CheckingAccount {
        return CheckingAccount()
    }
    
    func testNewAccountBalanceZero() {
        //let checkingAccount = CheckingAccount()
        XCTAssertEqual(checkingAccount.balance, 0)
    }
    
    func testCheckOverBudgetFails() {
        //let checkingAccount = CheckingAccount()
        let check = checkingAccount.writeCheck(amount: 100)
        XCTAssertNil(check)
    }
    
    func testCheckUnderBudgetSucceeds() {
        //let checkingAccount = CheckingAccount()
        checkingAccount.deposit(amount: 200)
        let check = checkingAccount.writeCheck(amount: 100)
        XCTAssertNotNil(check)
        XCTAssertEqual(check?.amount, 100, "check amount is not valid.")
        XCTAssertEqual(checkingAccount.balance, 100)
    }

    func testNewAPI() {
        guard #available(iOS 14, *) else {
          XCTFail("Only available in iOS 14 and above")
          return
        }
    }
    
//    func testNewAPI2() throws {
//        guard #available(iOS 14, *) else {
//            throw XCTSkip("Only available in iOS 14 and above") // Cannot find 'XCTSkip' in scope
//        }
//    }
}

BankingTests.defaultTestSuite.run()  // nothing happened !!



// MARK: - Challenge 1
class Logger {
    private init() { }
    
    static let sharedInstance = Logger()
    
    func log(_ text: String) {
        print(text)
    }
}

Logger.sharedInstance.log("Logger")
Logger.sharedInstance.log("Aytek")
//let logger = Logger()

// MARK: - Challenge 2
struct Stack<Element> {
    private var elements: [Element] = []
    
    func peek() -> Element? {
        elements.last
    }
    
    mutating func push(_ element: Element) {
        elements.append(element)
    }
    
    mutating func pop() -> Element? {
        if elements.isEmpty {
            return nil
        }
        return elements.removeLast()
    }
    
    func count() -> Int {
        elements.count
    }
}

var strings = Stack<String>()
strings.push("Pringles")
strings.push("Ruffles")
strings.push("Lays")
strings.count()
strings.peek()
print(strings.pop())
strings.push("Doritos")
print(strings.pop())
print(strings.pop())
print(strings.pop())

// MARK: - Challenge 3

