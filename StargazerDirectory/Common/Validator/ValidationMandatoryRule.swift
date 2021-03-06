//
//  ValidationMandatoryRule.swift
//  Common
//
//  Created by daniele on 18/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation

public struct ValidationMandatoryRule: ValidationRuleProtocol
{
    public init() {}
    
    public func validate(input: String) -> Bool
    {
        return !input.isEmpty
    }
}
