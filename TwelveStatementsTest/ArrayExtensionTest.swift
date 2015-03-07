//
//  ArrayExtensionTest.swift
//  ArrayExtensionTest
//
//  Created by Тимур on 07.03.15.
//  Copyright (c) 2015 SPbAU RAS. All rights reserved.
//

import Cocoa
import XCTest

class ArrayExtensionTest: XCTestCase {
    var array: [Int] = []

    override func setUp() {
        super.setUp()

        array = [1, 2, 3, 4]
    }
    
    func testTake() {
        XCTAssertEqual(array.take(-1), [], "Taking negative elements should provide empty array")

        XCTAssertEqual(array.take(0), [], "Taking zero elements should provide empty array")

        XCTAssertEqual(array.take(1), [1], "Taking should work correctly")
        XCTAssertEqual(array.take(2), [1, 2], "Taking should work correctly")
        XCTAssertEqual(array.take(array.count), array, "Taking should work correctly")

        XCTAssertEqual(array.take(array.count + 1), array, "Taking more than capacity should provide same array")
    }
    
    func testDrop() {
        XCTAssertEqual(array.drop(-1), array, "Dropping negative elements should provide the same array")
        XCTAssertEqual(array.drop(0), array, "Dropping zero elements should provide the same array")
        
        XCTAssertEqual(array.drop(1), [2, 3, 4], "Dropping should work correctly")
        XCTAssertEqual(array.drop(2), [3, 4], "Dropping should work correctly")
        XCTAssertEqual(array.drop(array.count - 1), [array.last!], "Dropping should work correctly")
        XCTAssertEqual(array.drop(array.count), [], "Dropping should work correctly")

        XCTAssertEqual(array.drop(array.count + 1), [], "Dropping more than capacity should provide empty array")
    }
}
