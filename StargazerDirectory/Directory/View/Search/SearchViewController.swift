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
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var ownerField: UITextField!
    @IBOutlet weak var repositoryLabel: UILabel!
    @IBOutlet weak var repositoryField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    var presenter: SearchPresenter!
    
    public class func createOne() -> SearchViewController
    {
        let vc: SearchViewController = self.loadFromStoryboard(storyboardName: "Directory", bundle: Bundle(for: Self.self))
        return vc
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setupUI()
        
        self.presenter.setup()
    }
    
    override public func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.showBackArrowOnly()
    }
    
    public override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        
        self.presenter.reset()
    }
}

private extension SearchViewController
{
    func setupUI()
    {
        self.view.backgroundColor = .white
    }
}

private extension SearchViewController
{
    @IBAction func searchButtonButtonPressed()
    {
        self.view.endEditing(true)
        
        self.presenter.search(owner: self.ownerField.text ?? "",
                              repository: self.repositoryField.text ?? "")
    }
}

extension SearchViewController: SearchPresenterViewProtocol
{
    public func updateMain(viewData: SearchViewData.MainViewData)
    {
        self.title = viewData.title
        self.ownerLabel.text = viewData.owner
        self.repositoryLabel.text = viewData.repository
        self.searchButton.setTitle(viewData.search, for: .normal)
    }
    
    public func updateEditing(viewData: SearchViewData.EditingViewData)
    {
        self.ownerField.text = viewData.owner
        self.repositoryField.text = viewData.repository
    }
}
