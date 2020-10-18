//
//  Validator.swift
//  Directory
//
//  Created by daniele on 18/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation
import Common

public struct Validator: ValidationProtocol
{
    public let rules: [ValidationRuleProtocol]
    
    public func validate(input: String) -> ValidationResult
    {
        let results = self.rules.map()
        { (rule) -> Bool in
            return rule.validate(input: input)
        }
        
        return ValidationResult(results: results, isValid: self.isValid(results: results))
    }
}
