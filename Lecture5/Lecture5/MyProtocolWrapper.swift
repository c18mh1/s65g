//
//  MyProtocolWrapper.swift
//  Lecture5
//
//  Created by Michelle on 7/21/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import Foundation

class MyProtocolWrapper
{
    let myVariable : MyProtocol
    required init (variable: MyProtocol)
    {
        myVariable = variable
    }
}