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
        let inputInvalid = "i n v a l i d"
        let rule = ValidationWithoutWhitespaceRule()
        
        XCTAssertEqual(rule.validate(input: inputValid), true)
        XCTAssertEqual(rule.validate(input: inputInvalid), false)
    }
    
    func testValidator()
    {
        let input = ""
        var ruleValid1 = ValidationRuleMock()
        ruleValid1._valid = true
        var ruleValid2 = ValidationRuleMock()
        ruleValid2._valid = true
        var ruleInvalid1 = ValidationRuleMock()
        ruleInvalid1._valid = false
        var ruleInvalid2 = ValidationRuleMock()
        ruleInvalid2._valid = false
        
        let validator1 = Validator(rules: [ruleValid1, ruleValid2])
        let result1 = validator1.validate(input: input)
        XCTAssertEqual(result1.isValid, true)
        XCTAssertEqual(result1.results.count, 2)
        
        let validator2 = Validator(rules: [ruleValid1, ruleInvalid2])
        let result2 = validator2.validate(input: input)
        XCTAssertEqual(result2.isValid, false)
        XCTAssertEqual(result2.results.count, 2)
        
        let validator3 = Validator(rules: [ruleInvalid1, ruleInvalid2])
        let result3 = validator3.validate(input: input)
        XCTAssertEqual(result3.isValid, false)
        XCTAssertEqual(result3.results.count, 2)
    }
}
