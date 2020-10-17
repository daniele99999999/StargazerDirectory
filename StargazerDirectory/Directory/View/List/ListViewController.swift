//
//  ListViewController.swift
//  StargazerDirectory
//
//  Created by daniele on 15/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import UIKit
import Common

public class ListViewController: UIViewController
{
    var presenter: ListPresenter!
    
    public class func createOne() -> ListViewController
    {
        let vc: ListViewController = self.loadFromStoryboard(storyboardName: "Directory", bundle: Bundle(for: Self.self))
        return vc
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = .green
    }
    
    override public func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.showBackArrowOnly()
    }
}

