//
//  ValidationProtocol.swift
//  Common
//
//  Created by daniele on 18/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation

public protocol ValidationProtocol
{
    func validate(input: String, rules: [ValidationRuleProtocol]) -> [Bool]
}
