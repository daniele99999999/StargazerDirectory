//
//  NetworkProtocol.swift
//  Common
//
//  Created by daniele on 17/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation

public protocol NetworkProtocol
{
    @discardableResult func networkDataTask(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) -> VoidClosure
}

