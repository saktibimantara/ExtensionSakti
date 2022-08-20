//
//  ExtensionSaktiTests.swift
//  ExtensionSaktiTests
//
//  Created by Ragil Bimantara on 13/08/22.
//

import XCTest
import Foundation
@testable import ExtensionSakti

class ExtensionSaktiTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    func testSafeArray() {
        let subject = ["item1","item2", "item3"]
        
        XCTAssertNil(subject[safe:3])
        
    }
    

}
