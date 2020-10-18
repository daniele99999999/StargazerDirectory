//
//  SearchViewData.swift
//  Directory
//
//  Created by daniele on 18/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation

public enum SearchViewData {}

extension SearchViewData
{
    public struct MainViewData: Codable
    {
        let title: String
        let owner: String
        let repository: String
        let search: String
    }
}

extension SearchViewData
{
    public struct EditingViewData: Codable, Equatable
    {
        let owner: String
        let repository: String
    }
}
