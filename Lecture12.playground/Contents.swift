//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let sum = arr.reduce(0) //0 is the initial value
{
    return $0 + $1
}

//find the greatest number in an array
let greatest = arr.reduce(0) {$0 > $1 ? $0 : $1}
greatest

/*
let alert = UIAlertView(title: "Hey look at this", message: "You have an alert", delegate: nil, cancelButtonTitle: "cancel")

alert
 */