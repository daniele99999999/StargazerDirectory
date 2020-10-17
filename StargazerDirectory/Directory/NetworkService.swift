//
//  NetworkService.swift
//  Directory
//
//  Created by daniele on 17/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation
import Common

enum NetworkError: Error
{
    case generic
}

public struct NetworkService
{
    let session: URLSession
    
    public init(session: URLSession = URLSession(configuration: .default))
    {
        self.session = session
    }
}

extension NetworkService: NetworkProtocol
{
    @discardableResult public func networkDataTask(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) -> VoidClosure
    {
        let task = self.session.dataTask(with: request)
        { data, _, error in
            switch (data, error)
            {
            case let (_, .some(error)):
                completion(.failure(error))
            case let (.some(data), .none):
                completion(.success(data))
            case (.none, .none):
                completion(.failure(NetworkError.generic))
            }
        }
        task.resume()
        return task.cancel
    }
}

