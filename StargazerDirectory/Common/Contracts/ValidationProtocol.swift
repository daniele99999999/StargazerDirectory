//
//  ValidationProtocol.swift
//  Common
//
//  Created by daniele on 18/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation

public typealias ValidationResult = (errors: [Bool], isValid: Bool)

public protocol ValidationProtocol
{
    func validate(input: String, rules: [ValidationRuleProtocol]) -> ValidationResult
}

extension ValidationProtocol
{
    public func isValid(errors: [Bool]) -> Bool
    {
        return !errors.contains(false)
    }
}
