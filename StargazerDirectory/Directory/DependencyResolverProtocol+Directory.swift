//
//  DependencyResolverProtocol+Directory.swift
//  Directory
//
//  Created by daniele on 17/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation
import Common

extension DependencyResolverProtocol
{
    func resolve() -> SearchViewController
    {
        let vc = SearchViewController.createOne()
        vc.presenter = SearchPresenter()
        return vc
    }

    func resolve(owner: String, repository: String) ->  ListViewController
    {
        let vc = ListViewController.createOne()
        vc.presenter = ListPresenter()
        return vc
    }
}