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

public class DirectoryCoordinator
{
    weak var rootController: UINavigationController?
    let resolver: DependencyResolverProtocol
    
    public init(rootController: UINavigationController, resolver: DependencyResolverProtocol)
    {
        self.rootController = rootController
        self.resolver = resolver
    }
    
    public func showError(title: String, message: String)
    {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Error.button.ok.title", bundle: Bundle(for: Self.self), comment: ""), style: .default, handler: nil))
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

extension DirectoryCoordinator: SearchPresenterCoordinatorProtocol, ListPresenterCoordinatorProtocol
{
    public func navigateToError(title: String, message: String)
    {
        self.showError(title: title, message: message)
    }
    
    public func navigateToList(search: SearchModel)
    {
        self.showList(search: search)
    }
}
