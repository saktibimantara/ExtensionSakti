//
//  StringTests.swift
//  ExtensionSaktiTests
//
//  Created by Ragil Bimantara on 13/08/22.
//

import XCTest
@testable import ExtensionSakti

class StringTests: XCTestCase {
    
    var subject: String!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        subject = "My name is KEN, and I live in Jakarta"
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testContains() {
        XCTAssertFalse(subject.contains(find: "ken"))
        XCTAssertTrue(subject.contains(find: "Jakarta"))
    }
    
    func testContainsIgnoreCase() {
        XCTAssertTrue(subject.containsIgnoringCase(find: "ken"))
    }

}
