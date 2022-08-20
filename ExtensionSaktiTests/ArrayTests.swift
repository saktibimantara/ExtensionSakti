//
//  ArrayTests.swift
//  ExtensionSaktiTests
//
//  Created by Ragil Bimantara on 13/08/22.
//

import XCTest
@testable import ExtensionSakti

class ArrayTests: XCTestCase {
    
    var subject: [String]!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        subject = ["Test", "Test2", "Test3"]
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSubscript() {
        
        XCTAssertNil(subject[safe: 3])
        XCTAssertEqual("Test", subject[safe: 0])
    }


}
