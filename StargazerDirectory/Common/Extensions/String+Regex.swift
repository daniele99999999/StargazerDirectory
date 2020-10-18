//
//  String+Regex.swift
//  Common
//
//  Created by daniele on 18/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation

extension String
{
    public func match(pattern: String) -> Bool
    {
        return self.range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
