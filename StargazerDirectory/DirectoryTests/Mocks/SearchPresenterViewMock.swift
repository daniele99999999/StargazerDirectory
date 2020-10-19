//
//  SearchPresenterViewMock.swift
//  DirectoryTests
//
//  Created by daniele on 19/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation
@testable import Directory
@testable import Common

class SearchPresenterViewMock: SearchPresenterViewProtocol
{
    var _mainViewData: ((SearchViewData.MainViewData) ->Void)?
    func updateMain(viewData: SearchViewData.MainViewData)
    {
        self._mainViewData?(viewData)
    }
    
    var _editingViewData: ((SearchViewData.EditingViewData) -> Void)?
    func updateEditing(viewData: SearchViewData.EditingViewData)
    {
        self._editingViewData?(viewData)
    }
}
