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
    public struct CellViewData: Codable, Equatable
    {
        let avatar: String
        let username: String
    }
}
