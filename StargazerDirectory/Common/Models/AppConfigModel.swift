//
//  AppConfigModel.swift
//  Common
//
//  Created by daniele on 17/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation

public struct AppConfigModel
{
    public let baseURL: URL
    
    public init(baseURL: URL)
    {
        self.baseURL = baseURL
    }
}


