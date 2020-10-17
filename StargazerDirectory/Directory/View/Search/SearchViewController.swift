//
//  SearchViewController.swift
//  StargazerDirectory
//
//  Created by daniele on 15/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import UIKit
import Common

public class SearchViewController: UIViewController
{
    var presenter: SearchPresenter!
    
    public class func createOne() -> SearchViewController
    {
        let vc: SearchViewController = self.loadFromStoryboard(storyboardName: "Directory", bundle: Bundle(for: Self.self))
        return vc
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
    }
    
    override public func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.showBackArrowOnly()
    }
}
