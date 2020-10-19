//
//  ListPresenterTests.swift
//  DirectoryTests
//
//  Created by daniele on 19/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import XCTest
@testable import Directory
@testable import Common

class ListPresenterTests: XCTestCase
{
    func testEmpty()
    {
        let expectation = self.expectation(description: "testEmpty")
        
        let searchModel = SearchModel(owner: "m.owner",
                                      repository: "m.repository")
        let elementPerPage = 20
        let page = 1
        
        let apiService = ApiServiceMock()
        apiService._getList = { _, _, _, _, completion in
            completion(.success([]))
        }
        
        let viewMock = ListPresenterViewMock()
        viewMock._updateCells = { viewData in
            expectation.fulfill()
            XCTAssertEqual(viewData.count, 0)
            
        }
        let coordinatorMock = ListPresenterCoordinatorMock()
        coordinatorMock._navigateToError = { title, message in
            XCTAssert(false)
        }
        let presenter = ListPresenter(viewDelegate: viewMock,
                                      coordinatorDelegate: coordinatorMock,
                                      apiService: apiService,
                                      search: searchModel,
                                      elementPerPage: elementPerPage,
                                      page: page)
        presenter.loadData()
        
        self.waitForExpectations(timeout: 1)
    }
    
    func testFull()
    {
        let expectation = self.expectation(description: "testFull")

        let searchModel = SearchModel(owner: "m.owner",
                                      repository: "m.repository")
        let elementPerPage = 20
        let page = 1
        
        let apiService = ApiServiceMock()
        apiService._getList = { _, _, _, _, completion in
            completion(.success([StargazerModel(id: 0, username: "username", avatar: "https://via.placeholder.com/100x100.png"),
                                 StargazerModel(id: 0, username: "username", avatar: "https://via.placeholder.com/100x100.png")]))
        }
        
        let viewMock = ListPresenterViewMock()
        viewMock._updateCells = { viewData in
            expectation.fulfill()
            XCTAssertEqual(viewData.count, 2)
        }
        let coordinatorMock = ListPresenterCoordinatorMock()
        coordinatorMock._navigateToError = { title, message in
            XCTAssert(false)
        }
        let presenter = ListPresenter(viewDelegate: viewMock,
                                      coordinatorDelegate: coordinatorMock,
                                      apiService: apiService,
                                      search: searchModel,
                                      elementPerPage: elementPerPage,
                                      page: page)
        presenter.loadData()
        
        self.waitForExpectations(timeout: 1)
    }
    
    func testError()
    {
        let expectation = self.expectation(description: "testError")

        struct FakeError: Error {}
        let fakeError = FakeError()
        let searchModel = SearchModel(owner: "m.owner",
                                      repository: "m.repository")
        let elementPerPage = 20
        let page = 1
        
        let apiService = ApiServiceMock()
        apiService._getList = { _, _, _, _, completion in
            completion(.failure(fakeError))
        }
        
        let viewMock = ListPresenterViewMock()
        viewMock._updateCells = { viewData in
            XCTAssert(false)
        }
        let coordinatorMock = ListPresenterCoordinatorMock()
        coordinatorMock._navigateToError = { title, message in
            expectation.fulfill()
            XCTAssertTrue(!title.isEmpty)
            XCTAssertTrue(!message.isEmpty)
        }
        let presenter = ListPresenter(viewDelegate: viewMock,
                                      coordinatorDelegate: coordinatorMock,
                                      apiService: apiService,
                                      search: searchModel,
                                      elementPerPage: elementPerPage,
                                      page: page)
        presenter.loadData()
        
        self.waitForExpectations(timeout: 1)
    }
    
    func testNextPage()
    {
        let expectation1 = self.expectation(description: "testNextPage1")

        let searchModel = SearchModel(owner: "m.owner",
                                      repository: "m.repository")
        let elementPerPage = 20
        let page = 1
        
        let apiService = ApiServiceMock()
        apiService._getList = { _, _, _, _, completion in
            completion(.success([StargazerModel(id: 0, username: "username", avatar: "https://via.placeholder.com/100x100.png"),
                                 StargazerModel(id: 0, username: "username", avatar: "https://via.placeholder.com/100x100.png")]))
        }
        
        let viewMock = ListPresenterViewMock()
        viewMock._updateCells = { viewData in
            expectation1.fulfill()
            XCTAssertEqual(viewData.count, 2)
            XCTAssertEqual(viewData.value[0].row, 0)
            XCTAssertEqual(viewData.value[1].row, 1)
        }
        let coordinatorMock = ListPresenterCoordinatorMock()
        coordinatorMock._navigateToError = { title, message in
            XCTAssert(false)
        }
        let presenter = ListPresenter(viewDelegate: viewMock,
                                      coordinatorDelegate: coordinatorMock,
                                      apiService: apiService,
                                      search: searchModel,
                                      elementPerPage: elementPerPage,
                                      page: page)
        presenter.loadData()
        
        self.waitForExpectations(timeout: 1)
        
        let expectation2 = self.expectation(description: "testNextPage2")
        
        apiService._getList = { _, _, _, _, completion in
            completion(.success([StargazerModel(id: 0, username: "username", avatar: "https://via.placeholder.com/100x100.png"),
                                 StargazerModel(id: 0, username: "username", avatar: "https://via.placeholder.com/100x100.png")]))
        }
        
        viewMock._updateCells = { viewData in
            expectation2.fulfill()
            XCTAssertEqual(viewData.count, 2)
            XCTAssertEqual(viewData.value[0].row, 2)
            XCTAssertEqual(viewData.value[1].row, 3)
        }
        
        presenter.loadNextPage()
        
        self.waitForExpectations(timeout: 1)
    }
    
    func testActivitySuccess()
    {
        let expectation = self.expectation(description: "testActivityError")
        expectation.expectedFulfillmentCount = 2

        let searchModel = SearchModel(owner: "m.owner",
                                      repository: "m.repository")
        let elementPerPage = 20
        let page = 1
        
        var loadingStartCount = 0
        var loadingStopCount = 0
        let apiService = ApiServiceMock()
        apiService._getList = { _, _, _, _, completion in
            completion(.success([]))
        }
        
        let viewMock = ListPresenterViewMock()
        viewMock._updateActivityStart = {
            loadingStartCount += 1
            expectation.fulfill()
        }
        viewMock._updateActivityStop = {
            loadingStopCount += 1
            expectation.fulfill()
        }
        let coordinatorMock = ListPresenterCoordinatorMock()
        let presenter = ListPresenter(viewDelegate: viewMock,
                                      coordinatorDelegate: coordinatorMock,
                                      apiService: apiService,
                                      search: searchModel,
                                      elementPerPage: elementPerPage,
                                      page: page)
        presenter.loadData()
        
        self.waitForExpectations(timeout: 1)
        XCTAssertEqual(loadingStartCount, loadingStopCount)
    }
    
    func testActivityError()
    {
        let expectation = self.expectation(description: "testActivityError")
        expectation.expectedFulfillmentCount = 2

        struct FakeError: Error {}
        let fakeError = FakeError()
        let searchModel = SearchModel(owner: "m.owner",
                                      repository: "m.repository")
        let elementPerPage = 20
        let page = 1
        
        var loadingStartCount = 0
        var loadingStopCount = 0
        let apiService = ApiServiceMock()
        apiService._getList = { _, _, _, _, completion in
            completion(.failure(fakeError))
        }
        
        let viewMock = ListPresenterViewMock()
        viewMock._updateActivityStart = {
            loadingStartCount += 1
            expectation.fulfill()
        }
        viewMock._updateActivityStop = {
            loadingStopCount += 1
            expectation.fulfill()
        }
        let coordinatorMock = ListPresenterCoordinatorMock()
        let presenter = ListPresenter(viewDelegate: viewMock,
                                      coordinatorDelegate: coordinatorMock,
                                      apiService: apiService,
                                      search: searchModel,
                                      elementPerPage: elementPerPage,
                                      page: page)
        presenter.loadData()
        
        self.waitForExpectations(timeout: 1)
        XCTAssertEqual(loadingStartCount, loadingStopCount)
    }
}
