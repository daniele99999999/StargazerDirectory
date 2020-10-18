//
//  ListViewCell.swift
//  Directory
//
//  Created by daniele on 18/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import UIKit
import Common
import Kingfisher

public class ListViewCell: UITableViewCell
{
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override public func awakeFromNib()
    {
        super.awakeFromNib()
        
    }
    
    override public func prepareForReuse()
    {
        super.prepareForReuse()
        
        self.usernameLabel.text = nil
        self.avatarImageView.kf.cancelDownloadTask()
    }
    
    public func loadData(viewData: ListViewData.CellViewData)
    {
        self.usernameLabel.text = viewData.username
        self.avatarImageView.kf.setImage(with: URL(string: viewData.avatar))
    }
}
