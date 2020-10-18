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
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var goButton: UIButton!
    
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
    }
    
    override public func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.showBackArrowOnly()
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
    @IBAction func goButtonPressed()
    {
        self.view.endEditing(true)
        
        // TODO
    }
}

extension SearchViewController: SearchPresenterViewProtocol
{
    
}
