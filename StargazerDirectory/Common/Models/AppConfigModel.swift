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
    public let errorMessageTitle: String
    
    public init(baseURL: URL, errorMessageTitle: String)
    {
        self.baseURL = baseURL
        self.errorMessageTitle = errorMessageTitle
    }
}


