//
//  SearchPresenterCoordinatorMock.swift
//  DirectoryTests
//
//  Created by daniele on 19/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation
@testable import Directory
@testable import Common

class SearchPresenterCoordinatorMock: SearchPresenterCoordinatorProtocol
{
    var _navigateToList: ((SearchModel) -> Void)?
    func navigateToList(search: SearchModel)
    {
        self._navigateToList?(search)
    }
    
    var _navigateToError: ((String, String) -> Void)?
    func navigateToError(title: String, message: String)
    {
        self._navigateToError?(title, message)
    }
}
