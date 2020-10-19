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
    func resolve(coordinatorDelegate: SearchPresenterCoordinatorProtocol) -> SearchViewController
    {
        let vc = SearchViewController.createOne()
        vc.presenter = SearchPresenter(viewDelegate: vc,
                                       coordinatorDelegate: coordinatorDelegate)
        return vc
    }

    func resolve(coordinatorDelegate: ListPresenterCoordinatorProtocol, search: SearchModel) ->  ListViewController
    {
        let vc = ListViewController.createOne()
        vc.presenter = ListPresenter(viewDelegate: vc,
                                     coordinatorDelegate: coordinatorDelegate,
                                     apiService: self.resolve(),
                                     search: search)
        vc.dataSource = ListViewDatasource(provider: vc.presenter)
        return vc
    }
}
