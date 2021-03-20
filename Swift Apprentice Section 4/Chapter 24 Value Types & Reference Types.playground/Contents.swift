import UIKit
import Foundation

var str = "Hello, playground"

struct Color: CustomStringConvertible {
    var red, green, blue: Double
    
    var description: String {
        "r: \(red) g: \(green) b: \(blue)"
    }
}

extension Color {
    static var black = Color(red: 0, green: 0, blue: 0)
    static var white = Color(red: 1, green: 1, blue: 1)
    static var blue = Color(red: 0, green: 0, blue: 1)
    static var green = Color(red: 0, green: 1, blue: 0)
}

extension Color {
    mutating func darken() {
        red *= 0.9; green *= 0.9; blue *= 0.9
    }
}

struct PaintingPlan {
    var accent = Color.white
    private var bucket = Bucket(color: .blue)
    
    var bucketColor: Color {
        get {
            bucket.color
        }
        set {
            bucket = Bucket(color: newValue)
        }
    }
}

class Bucket {
    var color: Color
    var isRefilled = false
    
    init(color: Color) {
        self.color = color
    }
    
    func refill() {
        isRefilled = true
    }
}

let azurePaint = Bucket(color: .blue)
let wallBluePaint = azurePaint
wallBluePaint.isRefilled
azurePaint.refill()
wallBluePaint.isRefilled

var azure = Color.blue
var wallBlue = azure
azure
wallBlue.darken()
azure

var artPlan = PaintingPlan()
var housePlan = artPlan
artPlan.bucketColor
housePlan.bucketColor = Color.green
artPlan.bucketColor = Color.green
artPlan.accent = Color.black
housePlan.accent

var a = UIImage(named: "smile.jpg")
var b = a
//computeValue(b)
//doSomething(a)
//computeValue(b)

