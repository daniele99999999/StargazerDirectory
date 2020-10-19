//
//  SearchPresenterTests.swift
//  DirectoryTests
//
//  Created by daniele on 19/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import XCTest
@testable import Directory
@testable import Common

class SearchPresenterTests: XCTestCase
{
    func testEmpty()
    {
        let viewMock = SearchPresenterViewMock()
        
        let presenter = SearchPresenter(viewDelegate: viewMock,
                                        coordinatorDelegate: nil)
        
        viewMock._mainViewData = { viewData in
            XCTAssertNotNil(viewData.title)
            XCTAssertNotNil(viewData.owner)
            XCTAssertNotNil(viewData.repository)
            XCTAssertNotNil(viewData.search)
        }
        
        viewMock._editingViewData = { viewData in
            XCTAssertNotNil(viewData.owner)
            XCTAssertTrue(viewData.owner.isEmpty)
            XCTAssertNotNil(viewData.repository)
            XCTAssertTrue(viewData.repository.isEmpty)
        }
        
        presenter.loadData()
    }
    
    func testSearchValid()
    {
        let searchModelMock = SearchModel(owner: "s.owner",
                                          repository:"s.repository")
        
        let viewMock = SearchPresenterViewMock()
        let coordinatorMock = SearchPresenterCoordinatorMock()
        coordinatorMock._navigateToList = { searchModel in
            XCTAssertEqual(searchModelMock, searchModel)
        }
        coordinatorMock._navigateToError = { title, message in
            XCTAssert(false)
        }
        let presenter = SearchPresenter(viewDelegate: viewMock,
                                        coordinatorDelegate: coordinatorMock)
        
        presenter.loadData()
        presenter.search(owner: searchModelMock.owner, repository: searchModelMock.repository)
    }
    
    func testSearch1Invalid()
    {
        let searchModelMock = SearchModel(owner: "s.o w n e r",
                                      repository:"s.repository")
        
        let viewMock = SearchPresenterViewMock()
        let coordinatorMock = SearchPresenterCoordinatorMock()
        coordinatorMock._navigateToList = { searchModel in
            XCTAssert(false)
        }
        coordinatorMock._navigateToError = { title, message in
            XCTAssertTrue(!title.isEmpty)
            XCTAssertTrue(!message.isEmpty)
        }
        let presenter = SearchPresenter(viewDelegate: viewMock,
                                        coordinatorDelegate: coordinatorMock)
        
        presenter.loadData()
        presenter.search(owner: searchModelMock.owner, repository: searchModelMock.repository)
    }
    
    func testSearch2Invalid()
    {
        let searchModelMock = SearchModel(owner: "s.owner",
                                      repository:"s.r e p o s i t o r y")
        
        let viewMock = SearchPresenterViewMock()
        let coordinatorMock = SearchPresenterCoordinatorMock()
        coordinatorMock._navigateToList = { searchModel in
            XCTAssert(false)
        }
        coordinatorMock._navigateToError = { title, message in
            XCTAssertTrue(!title.isEmpty)
            XCTAssertTrue(!message.isEmpty)
        }
        let presenter = SearchPresenter(viewDelegate: viewMock,
                                        coordinatorDelegate: coordinatorMock)
        
        presenter.loadData()
        presenter.search(owner: searchModelMock.owner, repository: searchModelMock.repository)
    }
}
