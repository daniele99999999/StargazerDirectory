//
//  StargazerModel.swift
//  Common
//
//  Created by daniele on 18/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation

public struct StargazerModel: Codable, Equatable
{
    public let id: Int
    public let username: String?
    public let avatar: URL?
    
    enum CodingKeys: String, CodingKey
    {
        case id
        case username = "login"
        case avatar = "avatar_url"
    }
}
