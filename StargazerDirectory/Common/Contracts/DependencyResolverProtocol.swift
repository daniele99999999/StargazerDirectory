//
//  DependencyResolverProtocol.swift
//  Common
//
//  Created by daniele on 17/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation

public protocol DependencyResolverProtocol
{
    func resolve() -> NetworkProtocol
    func resolve() -> APIProtocol
    func resolve() -> AppConfigModel
}
