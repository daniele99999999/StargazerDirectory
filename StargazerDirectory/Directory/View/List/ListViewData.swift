//
//  ListViewData.swift
//  Directory
//
//  Created by daniele on 18/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation

public enum ListViewData {}

extension ListViewData
{
    public struct MainViewData: Codable
    {
        let title: String
    }
}

extension ListViewData
{
    public enum ListDataUpdate: Equatable
    {
        case insert([IndexPath])
        
        var count: Int
        {
            switch self
            {
            case let .insert(indexPaths):
                return indexPaths.count
            }
        }
        
        var value: [IndexPath]
        {
            switch self
            {
            case let .insert(indexPaths):
                return indexPaths
            }
        }
    }
    
    public struct CellViewData: Codable, Equatable
    {
        let avatar: String
        let username: String
    }
}
