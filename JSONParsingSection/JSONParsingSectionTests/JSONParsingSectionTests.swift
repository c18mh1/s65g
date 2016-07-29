//
//  JSONParsingSectionTests.swift
//  JSONParsingSectionTests
//
//  Created by Michelle on 7/28/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import XCTest
@testable import JSONParsingSection

class JSONParsingSectionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadJSONFile() {
        
        let path = NSBundle.mainBundle().pathForResource("S65g", ofType: "json")
        XCTAssertNotNil(path)
        let data = NSData(contentsOfFile: path!)
        XCTAssertNotNil(data)
        
        
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
   func testDeserializeJson()
    {
        let deserializedJson = deserializeFile()
        XCTAssertTrue(deserializedJson is [AnyObject])
    }
    
    func deserializeFile() -> [AnyObject]
    {
        let path = NSBundle.mainBundle().pathForResource("S65g", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let deserializedJson = try? NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
        return deserializedJson as! [AnyObject]
        
    }
    
    func testArrayContainsDictionaries()
    {
        let deserializedJson = deserializeFile()
        XCTAssertTrue(deserializedJson is [NSDictionary])
    }
    
    func testDictionaryKeys()
    {
        let deserializedJson = deserializeFile() as! [NSDictionary]
        for obj in deserializedJson
        {
            XCTAssertNotNil(obj["title"])
            XCTAssertNotNil(obj["contents"])
        }
    }
    
    func parseJson() -> [GridConfiguration]?
    {
        let deserializedJson = deserializeFile()
        let parser = GridConfigurationParser(configurations: deserializedJson)
        let configs = parser.parse()
        return configs
    }
    
    func testParser()
    {
        let configs = parseJson()
        XCTAssertNotNil(configs)
        XCTAssertEqual(configs?.count, 2)
    }
    
    /*
    func testParserObjectContent()
    {
        let configs = parseJson()
        XCTAssertEqual(<#T##expression1: [T : U]##[T : U]#>, <#T##expression2: [T : U]##[T : U]#>)
        XCTAssertEqual()
    }
 */
}

