//
//  ListPresenterCoordinatorMock.swift
//  DirectoryTests
//
//  Created by daniele on 19/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation
@testable import Directory
@testable import Common

class ListPresenterCoordinatorMock: ListPresenterCoordinatorProtocol
{
    var _navigateToError: ((String, String) -> Void)?
    func navigateToError(title: String, message: String)
    {
        self._navigateToError?(title, message)
    }
}
