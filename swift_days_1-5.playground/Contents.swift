import UIKit

// DAY 1 - SIMPLE TYPES - strings + simple data types + string interpolation
var greeting = "Hello, playground"
greeting = "Goodbye"

var people = 8_000_000

var str1 = """
This goes
over multiple
lines
"""

var joey = """
how \
you \
doin
"""

var pi = 3.141

var awesome = true

var nrgradnpa = 88
var agegradnpa = "Grandpa's age is \(nrgradnpa)"

let taylor = "swift"

let album: String = "Red"



// DAY 2 - COMPLEX TYPES - arrays + dictionaries + sets + enums
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo] // array

let colors = Set(["red", "green", "blue"]) // set

var name = (first: "Taylor", last: "Swift") //tuple

let heights = [                            //dictionary
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
heights["Ed Sheeran"]
heights["Justin Bieber", default: 0.0]

var teams = [String: String]() //empty dictionary
teams["Paul"] = "Red"
var results = [Int]()  //empty array

var scores = Dictionary<String, Int>()  //empty dictionary
var resultsArr = Array<Int>() //empty array

var words = Set<String>()  // empty set
var numbers = Set<Int>()   // empty set


enum Result {
    case success
    case failure
}

enum Activity{
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let talking = Activity.talking(topic: "football")

enum Planet: Int{
    case mercury = 1
    case venus
    case earth
    case mars
}
let earth = Planet(rawValue: 3)



// DAY 3 - OPERATORS AND CONDITIONS
// Operator Overloading
let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"


let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatlesSum = firstHalf + secondHalf

//Conditions
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

//  Combining conditions
let age1 = 12
let age2 = 21
if age1 > 18 && age2 > 18 {
    print("Both are over 18") }

// Ternary Operator
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")

// Switch statements
let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}

let score = 85
switch score {
case 0..<50:
    print("You failed badly")
case 50..<85:
    print("Yout did ok")
default:
    print("You did great!")
}


// DAY 4 - LOOPS
let count = 1...10

// for loop
for number in count {
    print("Number is \(number)")
}

let albums1 = ["Red", "1989", "Reputation"]

for album1 in albums1 {
    print("\(album1) is on Apple Music")
}

print("Players gonna ")
for _ in 1...5 {
    print ("play")}

// while loop
var nr1 = 1
while nr1 <= 20 {
    print(nr1)
    nr1 += 1
}
print("Ready or not, here I come!")

//repeat loop
var nr2 = 1
repeat {
    print(nr1)
    nr2 += 1
} while nr2 <= 20
print("Ready or not, here I come!")

// exiting loops
var countDown = 10

while countDown >= 0 {
    print(countDown)
    if countDown == 4 {
        print("Im board, let's go now")
        break
    }
    countDown -= 1
}
print("Blast off!")

// exiting multiple loops
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

// skipping items
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    print(i)
}

// infinte loops
var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}

// DAY 5 - FUNCTIONS & PARAMETERS & ERRORS

func printHelp() {
    let message = """
Welcome to myApp!
Googbye!
"""
    print(message)
}


func square(number: Int) {
    print(number * number)
}
square(number: 8)

func square2(number: Int) -> Int {
    return number * number
}

let reesult2 = square2(number: 8)
print(reesult2)

func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Taylor")

func isPassingGrade(for scores: [Int]) -> Bool {
    var total = 0
    for score in scores {
        total += score
    }
    if total >= 500 {
        return true
    } else {
        return false
    }
}

// default parameters
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}
greet("Taylor")
greet("Taylor", nicely: false)

// variadic functions
print("Haters", "gonna", "hate")
func square3(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
square3(numbers: 1,2,3,4,5)

// writing throwing functions
enum PasswordError: Error {
    case obious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obious
    }
    return true
}

do {
    try checkPassword("password")
    print("That password is not good!")
} catch {
    print("You can't use that password.")
}

// inout parameters

func doubleInPlace(number: inout Int) {
    number *= 2
}
var myNum = 10
doubleInPlace(number: &myNum)
