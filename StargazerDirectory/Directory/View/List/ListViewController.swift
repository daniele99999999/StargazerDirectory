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
    var dataSource: ListViewDatasource!
    
    public class func createOne() -> ListViewController
    {
        let vc: ListViewController = self.loadFromStoryboard(storyboardName: "Directory", bundle: Bundle(for: Self.self))
        return vc
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setupUI()
        
        self.presenter.loadData()
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
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self
        self.tableView.contentInset = .init(top: 0, left: 0, bottom: 116, right: 0)
        self.activityPageIndicator.startAnimating()
    }
}

extension ListViewController: UITableViewDelegate
{
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        guard self.dataSource.isLast(index: indexPath.row) else { return }
            
        // Added fake delay for show activity
        DispatchQueue.main.asyncAfter(deadline: .now() + 1)
        { [weak self] in
            self?.presenter.loadNextPage()
        }
    }
}


extension ListViewController: ListPresenterViewProtocol
{
    public func updateCells(viewData: ListViewData.ListDataUpdate)
    {
        self.tableView.beginUpdates()
        switch viewData
        {
        case .insert(let indexPaths):
            self.tableView.insertRows(at: indexPaths, with: .fade)
        }
        self.tableView.endUpdates()
    }
    
    public func updateMain(viewData: ListViewData.MainViewData)
    {
        self.title = viewData.title
    }
    
    public func updateActivity(isLoading: Bool)
    {
        // TODO gestire l'activity
    }
}
