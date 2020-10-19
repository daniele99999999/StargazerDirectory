//
//  ApiService.swift
//  Directory
//
//  Created by daniele on 17/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation
import Common

public struct ApiService
{
    enum Endpoints
    {
        case list(owner: String, repository: String)
        
        var pathPre: String
        {
            switch self
            {
            case .list:
                return "repos"
            }
        }
        
        var pathPost: String
        {
            switch self
            {
            case .list:
                return "stargazers"
            }
        }
        
        func url(baseURL: URL) -> URL
        {
            switch self
            {
            case .list(let owner, let repository):
                return baseURL.appendingPathComponent(self.pathPre).appendingPathComponent(owner).appendingPathComponent(repository).appendingPathComponent(self.pathPost)
            }
        }
    }
    
    let baseURL: URL
    let networkService: NetworkProtocol
    
    public init(baseURL: URL, networkService: NetworkProtocol)
    {
        self.baseURL = baseURL
        self.networkService = networkService
    }
}

extension ApiService: APIHandleResponseProtocol {}
extension ApiService: APIProtocol
{
    public func apiGetList(owner: String, repository: String, elementPerPage: Int, page: Int, completion: @escaping (Result<[StargazerModel], Error>) -> Void)
    {
        let url = Endpoints.list(owner: owner, repository: repository).url(baseURL: self.baseURL)
        let queryItems = [URLQueryItem(name: "page", value: String(page)),
                          URLQueryItem(name: "per_page", value: String(elementPerPage))]
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = queryItems
        guard let fullUrl = urlComponents?.url else { return }
        let request = URLRequest(url: fullUrl)
        _ = self.networkService.networkDataTask(request: request,
                                                completion: self.handleResponse(completion: completion))
    }
}


