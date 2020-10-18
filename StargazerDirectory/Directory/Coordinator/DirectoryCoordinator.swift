//
//  DirectoryCoordinator.swift
//  Directory
//
//  Created by daniele on 16/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation
import UIKit
import Common

public struct DirectoryCoordinator
{
    weak var rootController: UINavigationController?
    let resolver: DependencyResolverProtocol
    
    public init(rootController: UINavigationController, resolver: DependencyResolverProtocol)
    {
        self.rootController = rootController
        self.resolver = resolver
    }
    
    public func showError(message: String)
    {
        let appConfig: AppConfigModel = self.resolver.resolve()
        let alert = UIAlertController.init(title: appConfig.errorMessageTitle, message: message, preferredStyle: .alert)
        self.rootController?.present(alert, animated: true, completion: nil)
    }
    
    public func showSearch()
    {
        let vc: SearchViewController = self.resolver.resolve(coordinator: self)
        self.rootController?.pushViewController(vc, animated: false)
    }
    
    public func showList(search: SearchModel)
    {
        let vc: ListViewController = self.resolver.resolve(coordinator: self, search: search)
        self.rootController?.pushViewController(vc, animated: true)
    }
}

extension DirectoryCoordinator: CoordinatorProtocol
{
    public func start()
    {
        self.showSearch()
    }
}

extension DirectoryCoordinator: SearchPresenterCoordinatorProtocol
{
    public func showError(value: String)
    {
        self.showError(message: value)
    }
    
    public func navigateList(search: SearchModel)
    {
        self.showList(search: search)
    }
}

extension DirectoryCoordinator: ListPresenterCoordinatorProtocol {}
