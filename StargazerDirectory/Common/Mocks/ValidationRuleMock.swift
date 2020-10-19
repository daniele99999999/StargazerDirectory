//
//  ValidationRuleMock.swift
//  CommonTests
//
//  Created by daniele on 19/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

// TODO do a test specific target for all mocks and related stuff
import Foundation

struct ValidationRuleMock: ValidationRuleProtocol
{
    var _valid: Bool!
    func validate(input: String) -> Bool
    {
        return _valid
    }
}
