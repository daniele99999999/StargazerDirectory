//
//  ValidationProtocol.swift
//  Common
//
//  Created by daniele on 18/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation

public typealias ValidationResult = (results: [Bool], isValid: Bool)

public protocol ValidationProtocol
{
    var rules: [ValidationRuleProtocol] {get}
    
    func validate(input: String) -> ValidationResult
}

extension ValidationProtocol
{
    public func isValid(results: [Bool]) -> Bool
    {
        return !results.contains(false)
    }
}
