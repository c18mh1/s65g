//: Playground - noun: a place where people can play

import Foundation

let immutableString = "Hello, playground"
var str = "Hello, playground"

str = "another string"

var myInt = 42
let myConstant = 50/100 //int --> truncates answer
let myConstant2 = 50.0/100 //double --> comes out with a double

let implicitDouble = 70.0
let explicitDouble: Double = 70

let label = "the width is "
let width = 94
let widthLabel = label + String(width) //convert int to String
String(24)

let apples = 3
let oranges = 5
let applesSummary = " I have \(apples) apples" //anything can be put in the ()
let orangesSummary = "I have \(oranges) oranges"

var shoppingList: Array = ["catfish", "water", "tulips", "blue paint", 47] //an array of ANY
shoppingList.append("toothpaste") //adds an element to the array
shoppingList.append(47) //a different 47 than the one already in the array

//copyList?


var shoppingList2: Array<String> = ["catfish", "water", "tulips", "blue paint"] //an array of Strings
shoppingList2.append("toothpaste")

//dictionary keyed by strings and value strings
var occupations: Dictionary<String, String> = [
    "malcom": "captain",
    "kalyee": "mechanic"
]
occupations["Jayne"] = "Public Relations"

var names = occupations.map //map takes a single argument called transform that is a function
var occupationNames = occupations.map { //(k:String, v:String) -> String in
    //return 
    $0.0 //k 
    }.map { $0;  "blah" }

occupationNames

var r = 50...100 //inclusive range of integers
var g = r.generate() //generator
g.next() //walking through the numbers in the range
g.next()

var g1 = [11, 21, 31, 41, 51].generate()
g1.next()
g1.next()

var tuple1 = (1,2) //how to do multiple return types, a collection of variables
tuple1.0
tuple1.1

var tuple2 = (first:"van", last:"simmons") //tuples are part of the swift type system
tuple2.0
tuple2.1

//for loops
for (k, v) in occupations {
    print("\(k), \(v)") //prints to the console not to the right hand
}

//functions
func doubler(x:Int) -> Int //takes an argment of type int and reutnrs an int
{
    return x*2
}

doubler(4)

func doubleDoubler(x:Double) -> Double
{
    return x*2
}

doubler(3)

func progression(v:Int,f:Int->Int) ->Int {
    return f(v)
}

progression(4,f:doubler) //don't need to name only the first one
//progression (3,f:doubleDoubler) //wrong type

var tf = false
tf = true

var arrArr:Array<Array<Bool>> = [[true]] //array in an array, an array of an array of booleans
var arrArr2: Array<Dictionary<Int, Bool>> = [[1:true]]

//variable of a type function, called a closure
var closure = { (x:Int) -> Int in
return x*2
}

closure(6)
progression(6,f:closure)

//takes a closure as an argument
//put the function in and passed it as an argument, closure is being passed as an argument
//works in or out of brackets:
//progression (6, f: {(x:Int) --> Int in return x*2 })
progression(6) {(x:Int) -> Int in
return x*2
}

//optionals
var n:Int? = nil //check everytime n is used because it could be nil, could be an int

//doubler(n) //doubler says it HAS to be an int not that it coule be an int
//Int? is not the same (type) as Int


var optionalN:Int? = nil
var implicitOptionalN: Int! = 12 //! = optional type, will always have a value when you call it

//if it's not nil, then it succeedss
if let n = optionalN {
    let doubleN = doubler(n)
}

//! handles it for you - use carefully, ? makes you explicitly unwrap it 
//Int! is the same type as Int whereas Int? is not the same type as Int

doubler(implicitOptionalN)
