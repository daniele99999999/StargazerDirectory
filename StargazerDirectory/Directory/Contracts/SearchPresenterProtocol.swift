//
//  SearchPresenterProtocol.swift
//  Directory
//
//  Created by daniele on 17/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation

public typealias SearchPresenterProtocol = SearchPresenterViewProtocol & SearchPresenterCoordinatorProtocol

public protocol SearchPresenterViewProtocol
{
    
}

public protocol SearchPresenterCoordinatorProtocol
{
    func navigateList(owner: String, repository: String)
    func showError(value: String)
}
