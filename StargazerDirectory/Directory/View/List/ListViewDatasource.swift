//
//  ListViewDatasource.swift
//  Directory
//
//  Created by daniele on 19/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import UIKit

protocol ListViewDatasourceProvider
{
    var itemsCount: Int { get }
    func cellViewData(index: Int) -> ListViewData.CellViewData
}

class ListViewDatasource: NSObject
{
    fileprivate let provider: ListViewDatasourceProvider
    
    init(provider: ListViewDatasourceProvider)
    {
        self.provider = provider
    }
}

extension ListViewDatasource: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        self.provider.itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell", for: indexPath) as! ListViewCell
        let cellViewData = self.provider.cellViewData(index: indexPath.row)
        cell.loadData(viewData: cellViewData)
        return cell
    }
}

extension ListViewDatasource
{
    func isLast(index: Int) -> Bool
    {
        return index == (self.provider.itemsCount - 1)
    }
}
