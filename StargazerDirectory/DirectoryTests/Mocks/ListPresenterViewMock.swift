//
//  ListPresenterViewMock.swift
//  DirectoryTests
//
//  Created by daniele on 19/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation
@testable import Directory
@testable import Common

class ListPresenterViewMock: ListPresenterViewProtocol
{
    var _mainViewData: ((ListViewData.MainViewData) -> Void)?
    func updateMain(viewData: ListViewData.MainViewData)
    {
        self._mainViewData?(viewData)
    }
    
    var _updateCells: ((ListViewData.ListDataUpdate) -> Void)?
    func updateCells(viewData: ListViewData.ListDataUpdate)
    {
        self._updateCells?(viewData)
    }
    
    var _updateActivityStart: (() -> Void)?
    func updateActivityStart()
    {
        self._updateActivityStart?()
    }
    
    var _updateActivityStop: (() -> Void)?
    func updateActivityStop()
    {
        self._updateActivityStop?()
    }
}
