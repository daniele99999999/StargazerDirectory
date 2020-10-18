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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityPageIndicator: UIActivityIndicatorView!
    
    var presenter: ListPresenter!
    
    public class func createOne() -> ListViewController
    {
        let vc: ListViewController = self.loadFromStoryboard(storyboardName: "Directory", bundle: Bundle(for: Self.self))
        return vc
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    override public func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.showBackArrowOnly()
    }
}

private extension ListViewController
{
    func setupUI()
    {
        self.view.backgroundColor = .white
//        self.tableView.dataSource = dataSource
//        self.tableView.delegate = self
        self.tableView.contentInset = .init(top: 0, left: 0, bottom: 116, right: 0)
        self.activityPageIndicator.startAnimating()
    }
}
