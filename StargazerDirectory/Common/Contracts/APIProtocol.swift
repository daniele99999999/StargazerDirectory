//
//  APIProtocol.swift
//  Common
//
//  Created by daniele on 17/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation

public protocol APIProtocol
{
    func getList(owner: String, repository: String, elementPerPage: Int, page: Int, completion: @escaping (Result<[StargazerModel], Error>) -> Void)
}

public protocol APIHandleResponseProtocol
{
    func handleResponse<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void) -> (Result<Data, Error>) -> Void
}

public extension APIHandleResponseProtocol
{
    func handleResponse<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void) -> (Result<Data, Error>) -> Void
    {
        return { result in
            switch result
            {
            case .success(let data):
                do
                {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decoded))
                }
                catch let decodeError
                {
                    completion(.failure(decodeError))
                }
            case .failure(let responseError):
                completion(.failure(responseError))
            }
        }
    }
}

