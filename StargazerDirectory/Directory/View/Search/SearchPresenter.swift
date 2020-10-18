//
//  SearchPresenter.swift
//  Directory
//
//  Created by daniele on 17/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation
import Common

public protocol SearchPresenterViewProtocol: class
{
    
}

public protocol SearchPresenterCoordinatorProtocol
{
    func navigateList(search: SearchModel)
    func showError(value: String)
}

public struct SearchPresenter
{
    fileprivate weak var viewDelegate: SearchPresenterViewProtocol?
    fileprivate var coordinatorDelegate: SearchPresenterCoordinatorProtocol
    fileprivate let validatorOwner: ValidationProtocol
    fileprivate let validatorUsername: ValidationProtocol
    
    init(viewDelegate: SearchPresenterViewProtocol?, coordinatorDelegate: SearchPresenterCoordinatorProtocol)
    {
        self.viewDelegate = viewDelegate
        self.coordinatorDelegate = coordinatorDelegate
        self.validatorOwner = Validator()
        self.validatorUsername = Validator()
    }
    
    func setup()
    {
        
    }
}

