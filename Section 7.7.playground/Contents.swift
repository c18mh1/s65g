//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


enum SampleEnum : UInt
{
    case two = 2
    
}

enum Colleges : String
{
    case Harvard = "Harvard"
    case MIT = "MIT"
    case BC = "BC"
    case BU = "BU"
    
    
    /*
    static func myRawValue(college : Colleges) -> String
    {
        switch college
        {
            
        }
    }
    */
    
    func myRawValue() -> String
    {
        return self.rawValue
    }
    
    //return values
    //what methods already do this for an enum
    func collegesWithBInTheirNames() -> [Colleges]
    {
        return [Colleges.BC, Colleges.BU]
    }
}



/*

switch neigborsAlive
{
    case 0:
    case 1:
}
*/
