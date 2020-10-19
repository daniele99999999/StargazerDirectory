//
//  SearchModel.swift
//  Common
//
//  Created by daniele on 18/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation

public struct SearchModel: Codable, Equatable
{
    public let owner: String
    public let repository: String
    
    public init(owner: String, repository: String)
    {
        self.owner = owner
        self.repository = repository
    }
}
