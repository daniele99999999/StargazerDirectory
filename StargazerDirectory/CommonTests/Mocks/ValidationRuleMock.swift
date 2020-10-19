//
//  ValidationRuleMock.swift
//  CommonTests
//
//  Created by daniele on 19/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation
@testable import Common

struct ValidationRuleMock: ValidationRuleProtocol
{
    var _validate:(((String) -> Bool) -> Void)?
    func validate(input: String) -> Bool
    {
        return !input.isEmpty
    }
}
