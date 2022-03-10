import UIKit

//   DAY 11   //
//  Protocols, Extensions & Protocol Extensions //

/// 1.protocols
protocol Identifiable {
    var id: String { get set }
}
struct User: Identifiable {
    var id: String
}
func diplayId(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

/// 2.protocol inheritance
protocol Payable {
    func calculateWages() -> Int
}
protocol NeedsTraining {
    func study()
}
protocol HasVacation {
    func takeVacation(days: Int)
}
protocol Employee: Payable, NeedsTraining, HasVacation { }

/// 3.extensions
extension Int {
    func squareInt() -> Int {
        return self * self
    }
}
let number1 = 8
number1.squareInt()
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

/// 4.protocol extensions
let pythons = ["Eric", "John", "Michael"]
let beatles = Set(["John", "Paul", "George", "Ringo"])
extension Collection {
    func summarize() {
        print("There are \(count) of us")
        for name in self {
            print(name)
        }
    }
}
pythons.summarize()
beatles.summarize()

/// 5.protocol-oriented programming
protocol Identifiable2 {
    var id: String { get set }
    func identify()
}
extension Identifiable2 {
    func identify() {
        print("My ID is \(id)")
    }
}
struct User2: Identifiable2 {
    var id: String
}
let me2 = User2(id: "me2")
me2.identify()




//   DAY 12  //
//  Optionals, Unwrapping & Typecasting //

/// 1.handling missing data
var age: Int? = nil
age = 38

/// 2.unwrapping optionals
var name: String? = nil //optional string
if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name")
}

/// 3.unwrapping with guard
func greet(_ name: String?) {
    guard let unwrapped1 = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped1)!")
}

/// 4.force unwrapping
let str = "5"
let num = Int(str)!

/// 5.implicitly unwrapped optionals
let age5: Int! = nil  //if you always have a value before you need to use it

/// 6.nil coalescing
func username(for id: Int) -> String? {
    if id == 1 {
        return "Ed"
    } else {
        return nil
    }
}
let user = username(for: 15) ?? "Anonnymous"

/// 7.optional chaining
let names = ["John", "Paul", "George","Ringo"]
let beatle = names.first?.uppercased()

/// 8.optional try
enum PasswordError: Error {
    case obvious
}
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh")
}
try! checkPassword("Secret") // when you know for sure that the function will not fail
print("ok")
// isn't it useless? the "try!" ?

/// 9. failable initializers  - might work, might not
let stri = "5"
let numi = Int(stri)

struct Person {
    var id: String

    init?(id: String){
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

/// 10.typecasting
class Animal { }
class Fish: Animal { }
class Dog: Animal {
    func makeNoise() {
        print("Woof")
    }
}
let pets = [Fish(), Dog(), Fish(), Dog()]
for pet in pets {
    if let dog = pet as? Dog
    { dog.makeNoise() }

}



// CONSOLIDATION//
//   DAY 13  //
//  Swift review, day 1 //

/// 1.

//   DAY 14   //
//  Swift review, day 3//

/// 1.

//   DAY 15  //
//  Protocols, Extensions & Protocol Extensions //

