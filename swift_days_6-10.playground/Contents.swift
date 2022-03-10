import UIKit

    //   DAY 6   //
// Closures, part 1 //

/// 1. creating basic closures
let driving1 = {
    print("I'm driving in my car")
}
driving1()

/// 2. accepting parameters in a closure
let driving2 = { (place: String)  in
print("I'm going to \(place) in my car")
}
driving2("London")

/// 3. returning values from a closure
let driving3 = { (place: String) -> String
    in
    return "I'm going to \(place) in my car"
}
let message3 = driving3("Madrid")
print(message3)

/// 4. closures as parameters
func travel1(action: () -> Void) {
    print("I'm reday to go")
    action()
    print("I arrivied!")
}
travel1(action: driving1)

/// 5. trailing closure syntax
func travel2(action: () -> Void) {
    print("I'm reday to go")
    action()
    print("I arrivied!")
}
travel2 {
    print("I'm driving in my car")
}



    //   DAY 7   //
// Closures, part 2 //

/// 1. using closures as parameters when they accept parameters
func travel3(action: (String) -> Void){
    print("I'm ready to go")
    action("Paris")
    print("I arrived!")
}

travel3 { (place: String) in
    print("I'm going to \(place) in my car")
}

/// 2. using closures as parameters when they return values
func travel4(action: (String)-> String){
    print("I'm getting ready to go")
    let description = action("Chisinau")
    print(description)
    print("I arrived!")
}
travel4{ (place: String) -> String in
    return "I'm going to \(place) in my car"
}

/// 3. shorthand parameter names
func travel5(action: (String)-> String){
    print("I'm getting ready to go")
    let description = action("Chisinau")
    print(description)
    print("I arrived!")
}
travel5 {
    "I'm going to \($0) in my car"
}

/// 4. closures withh multiple parameters
func travel6(action: (String, Int)-> String){
    print("I'm getting ready to go")
    let description = action("Chisinau", 60)
    print(description)
    print("I arrived!")
}
travel6 {
 " I'm going to \($0) with \($1) miles per hour "
}

/// 5. returning closures from functions
func travel7() -> (String)-> Void {
    return {
        print("I'm going to \($0)")
    }
}
//var1
let result7 = travel7()
result7("London")

/// 6. capturing values
func travel8() -> (String) -> Void {
var counter = 1
    return {
        print("I'm going to \($0)")
        counter += 1
    }
}
let result8 = travel8()
result8("London")
result8("London")
result8("London")




    //   DAY 8   //
// Structs, part 1 //

/// 1.  creating your own structs
struct Sport {
    var name: String // we created a type
}
var tennis = Sport(name: "Tennis")
print(tennis.name)
tennis.name = "Lawn tennis"

/// 2. computed properties
struct Sport2{
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}
let chessBoxing = Sport2(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)


/// 3, property observers
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}
var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

/// 4. methods
struct City{
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}
let londonCity = City(population: 9_000_000)
londonCity.collectTaxes()

/// 5. mutating methods
struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}
var person = Person(name: "ED")
person.makeAnonymous()

/// 6.  properties and methods of strings
let string = "Do or do not, there is no try"
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

/// 7. properties and methods of arrays
var toys = ["Woody"]
print(toys.count)
toys.append("buzz")
toys.firstIndex(of: "buzz")
print(toys.sorted())
toys.remove(at: 0)
var fibonacci = [1, 1, 2, 3, 5, 8]
fibonacci.sorted() == [1, 2, 3, 5, 8]




    //   DAY 9   //
// Structs, part 2 //

/// 1. initializers
struct User {
    var username: String

    init() {
        username = "Anonnymous"
        print("Creating a new user!")
    }
}
var user = User()
user.username = "ed"

/// 2.  refering to the current instance
struct Person2 {
    var name: String

    init(name: String) {
        print("\(name) was born")
        self.name = name
    }
}

/// 3. lazy properties
struct FamilyTree {
    init () {
        print("Creating family tree!")
    }
}
struct Person3{
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}
var ed = Person3(name: "Ed")
ed.familyTree

/// 4. static properties and methods
struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let ed1 = Student(name: "Ed")
let taylor = Student(name: "Taylor")
print(Student.classSize)

/// 5. access control
struct Person4{
    private var id: String

    init(id: String){
        self.id = id
    }

    func identify() -> String {
        return "my social security numebr is \(id)"
    }
}
let ed4 = Person4(id: "123")

//test
struct Contributor {
    private var name = "Anonnymous"
}
let paul = Contributor()

struct Doctor41 {
    var name = "Joe"
    var location = "Iasi"
    private var currentPatient = "No one"
}
let drJones = Doctor41()
//??????????????????????????????????????????




    //   DAY 10   //
// Classes & inheritance //

/// 1.creating your own class
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String){
        self.name = name
        self.breed = breed
    }
}
let puppy = Dog(name: "goodboi", breed:"golden retriever")

/// 2.class inheritance
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

/// 3. overriding methods
class Cat {
    func makeNoise(){
        print("Meow")
    }
}
class Leutu: Cat {
    override func makeNoise() {
        print("Meeeeeeeeow")
    }
}
let leutu = Leutu()
leutu.makeNoise()

/// 4. final classes
final class Words {
}

/// 5.copying objects
class Singer {
    var name = "Adele"
}
var singer = Singer()
print(singer.name)
var singerCopy = singer
singerCopy.name = "Beyonce"
print(singer.name)

/// 6.deinitializers
class Person6 {
    var name = "John Doe"
    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }

    deinit {
        print("\(name) is no more!")
    }
}
for _ in 1...3 {
    let person6 = Person6()
    person6.printGreeting()
}

/// 7.mutability
class Singer7 {
    var name = "Beyonce" // let (if we want to make to property constant)
}
let beyonce7 = Singer7()
beyonce7.name = "Adele"
print(beyonce7.name)

