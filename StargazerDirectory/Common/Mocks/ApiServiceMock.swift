//
//  ApiServiceMock.swift
//  CommonTests
//
//  Created by daniele on 19/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

// TODO do a test specific target for all mocks and related stuff
import Foundation

class ApiServiceMock: APIProtocol
{
    var _getList:((String, String, Int, Int, @escaping (Result<[StargazerModel], Error>) -> Void) -> Void)?
    func getList(owner: String, repository: String, elementPerPage: Int, page: Int, completion: @escaping (Result<[StargazerModel], Error>) -> Void)
    {
        self._getList?(owner, repository, elementPerPage, page, completion)
    }
}
