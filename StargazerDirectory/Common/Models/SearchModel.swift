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
    let owner: String
    let repository: String
}
