//: Playground - noun: a place where people can play

import UIKit

//help from: section and https://www.weheartswift.com/higher-order-functions-map-filter-reduce-and-more/

func isLeap (year: Int) -> Bool
{
    return year%4 != 0 ? false : year%100 != 0 ? true : year%400 != 0 ? false : true
}

let months = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

func julianDate (year: Int, month: Int, day: Int) -> Int
{
    let yearDays = ((1900..<year).map({isLeap($0) == true ? 366 : 365})).reduce(0, combine: +)
    let monthDays = ((0..<month).map({isLeap(year) && $0 == 2 ? 29 : months[$0]})).reduce(0, combine: +)
    return yearDays + monthDays + day
}

julianDate(1960, month: 9, day: 28)
julianDate(1900, month: 1, day: 1)
julianDate(1900, month: 12, day: 31)
julianDate(1901, month: 1, day: 1)
julianDate(1901, month: 1, day: 1) - julianDate(1900, month: 1, day: 1)
julianDate(2001, month: 1, day: 1) - julianDate(2000, month: 1, day: 1)

isLeap(1960)
isLeap(1900)
isLeap(2000)

