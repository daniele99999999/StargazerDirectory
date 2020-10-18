//
//  AppResolver.swift
//  StargazerDirectory
//
//  Created by daniele on 15/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation
import Common
import Directory

struct AppResolver: DependencyResolverProtocol
{
    func resolve() -> NetworkProtocol
    {
        return NetworkService()
    }
    
    func resolve() -> APIProtocol
    {
        return ApiService(baseURL: self.resolve().baseURL, networkService: self.resolve())
    }
    
    func resolve() -> AppConfigModel
    {
        return AppConfigModel(baseURL: URL(string: "https://api.github.com/")!)
    }
}
