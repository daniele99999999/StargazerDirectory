//
//  ValidatorTests.swift
//  CommonTests
//
//  Created by daniele on 19/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import XCTest
@testable import Common

class ValidatorTests: XCTestCase
{
    func testMandatoryRule()
    {
        let inputValid = "valid"
        let inputInvalid = ""
        let rule = ValidationMandatoryRule()
        
        XCTAssertEqual(rule.validate(input: inputValid), true)
        XCTAssertEqual(rule.validate(input: inputInvalid), false)
    }
    
    func testWithoutWhitespaceRule()
    {
        let inputValid = "valid"
        let inputInvalid = "v a l i d"
        let rule = ValidationWithoutWhitespaceRule()
        
        XCTAssertEqual(rule.validate(input: inputValid), true)
        XCTAssertEqual(rule.validate(input: inputInvalid), false)
    }
    
    func testValidator()
    {
        // TODO
    }
}
