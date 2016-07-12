//
//  ExampleProtocol.swift
//  Lecture6
//
//  Created by Summer on 7/11/16.
//  Copyright (c) 2016 Michelle. All rights reserved.
//

import Foundation

protocol ExampleProtocol {
    //protocols don't actually have to declare anything
    var rows: UInt {get set}
    var cols: UInt {get set}
    var delegate: ExampleDelegateProtocol? {get set}
    func step() -> [[Bool]]
    
}

protocol ExampleDelegateProtocol
{
   func example(example: Example, didUpdateRows:UInt)
}

class Example: ExampleProtocol //conforms to the protocol 
{
    
    //UInts cannot be negative
    
    var rows: UInt = 0
    {
        didSet {
            if let delegate = delegate
            {
                delegate.example(self, didUpdateRows: rows)
            }
        }
    }
    
    var cols: UInt = 0
    var delegate: ExampleDelegateProtocol? //delegate conforms to the delegate protocol but is optional
    func step() -> [[Bool]]
    {
        return [[false]]
    }
}

class ExampleDelegate: ExampleDelegateProtocol
{
    func example(example: Example, didUpdateRows: UInt) {
        print ("Nothing")
    }
    
}