//
//  UIViewController+BackArrowOnly.swift
//  StargazerDirectory
//
//  Created by daniele on 15/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import UIKit

public extension UIViewController
{
    func showBackArrowOnly()
    {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
