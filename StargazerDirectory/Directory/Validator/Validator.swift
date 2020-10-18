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
    public func validate(input: String, rules: [ValidationRuleProtocol]) -> ValidationResult
    {
        let errors = rules.map()
        { (rule) -> Bool in
            return rule.validate(input: input)
        }
        
        return ValidationResult(errors: errors, isValid: self.isValid(errors: errors))
    }
    
    public init() {}
}
