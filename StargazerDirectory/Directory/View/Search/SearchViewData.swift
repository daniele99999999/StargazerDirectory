//
//  SearchViewData.swift
//  Directory
//
//  Created by daniele on 18/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation

enum SearchViewData {}

extension SearchViewData
{
    struct MainViewData: Codable
    {
        let title: String
        let owner: String
        let repository: String
    }
}

extension SearchViewData
{
    struct EditingViewData: Codable, Equatable
    {
        let owner: String
        let repository: String
    }
}

extension SearchViewData
{
    struct ErrorsViewData: Codable
    {
        let owner: [String]
        let repository: [String]
        
        var noErrors: Bool
        {
            return self.owner.isEmpty && self.repository.isEmpty
        }
    }
}
