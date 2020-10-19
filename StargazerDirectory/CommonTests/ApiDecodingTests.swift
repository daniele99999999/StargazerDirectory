//
//  ApiDecodingTests.swift
//  CommonTests
//
//  Created by daniele on 19/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import XCTest
@testable import Common

class ApiDecodingTests: XCTestCase
{
    var stargazerModelsDataMock: Data = StorageUtils.loadJSON(name: "StargazerModelsMock", bundle: Bundle(for: ApiDecodingTests.self))!
    
    func testDecodingApiList()
    {
        let url = URL(string: "https://www.google.com")!
        let owner = "owner"
        let repository =  "repository"
        let elementPerPage = 20
        let page = 1

        let expectation = self.expectation(description: "testDecodingApiList")
        let networkServiceMock = NetworkServiceMock()
        networkServiceMock._networkDataTask = { _, completion in
            completion(.success(self.stargazerModelsDataMock))
        }

        let apiService: ApiService = ApiService(baseURL: url,
                                                networkService: networkServiceMock)

        apiService.getList(owner: owner,
                           repository: repository,
                           elementPerPage: elementPerPage,
                           page: page)
        { result in
            let data = try! result.get()

            expectation.fulfill()
            XCTAssertEqual(data.count, 20)
            XCTAssertEqual(data.first?.id, 70)
            XCTAssertEqual(data.first?.avatar, "https://avatars0.githubusercontent.com/u/70?v=4")
            XCTAssertEqual(data.first?.username, "schacon")
            // TODO: check all
        }

        self.waitForExpectations(timeout: 1)
    }
}
