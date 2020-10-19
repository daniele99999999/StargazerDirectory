//
//  ListPresenter.swift
//  Directory
//
//  Created by daniele on 17/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation
import Common

public protocol ListPresenterViewProtocol: class
{
    func updateMain(viewData: ListViewData.MainViewData)
    func updateCells(viewData: ListViewData.ListDataUpdate)
    func updateActivityStart()
    func updateActivityStop()
}

public protocol ListPresenterCoordinatorProtocol: class
{
    func navigateToError(title: String, message: String)
}

public class ListPresenter
{
    fileprivate weak var viewDelegate: ListPresenterViewProtocol?
    fileprivate weak var coordinatorDelegate: ListPresenterCoordinatorProtocol?
    
    fileprivate let apiService: APIProtocol
    fileprivate let search: SearchModel
    
    fileprivate let elementPerPage: Int
    fileprivate var page: Int
    fileprivate var list: [StargazerModel] = []
    
    init(viewDelegate: ListPresenterViewProtocol?,
         coordinatorDelegate: ListPresenterCoordinatorProtocol?,
         apiService: APIProtocol,
         search: SearchModel,
         elementPerPage: Int = 20, // TODO: possible to add to AppConfig
         page: Int = 1)
    {
        self.viewDelegate = viewDelegate
        self.coordinatorDelegate = coordinatorDelegate
        self.apiService = apiService
        self.search = search
        self.elementPerPage = elementPerPage
        self.page = page
    }
    
    func loadData()
    {
        self.viewDelegate?.updateMain(viewData: Self.buildMainViewData(search: self.search))
        self.viewDelegate?.updateActivityStart()
        
        self.apiService.getList(owner: self.search.owner,
                                repository: self.search.repository,
                                elementPerPage: self.elementPerPage,
                                page: self.page)
        { (result: Result<[StargazerModel], Error>) in
            DispatchQueue.main.async
            { [weak self] in
                guard let self = self else { return }
                switch result
                {
                case .success(let stargazers):
                    let indexPaths = (self.list.count..<self.list.count + stargazers.count).map
                    {
                        return IndexPath(item: $0, section: 0)
                    }
                    self.list.append(contentsOf: stargazers)
                    self.viewDelegate?.updateActivityStop()
                    self.viewDelegate?.updateCells(viewData: ListViewData.ListDataUpdate.insert(indexPaths))
                case .failure(let error):
                    self.viewDelegate?.updateActivityStop()
                    self.coordinatorDelegate?.navigateToError(title: NSLocalizedString("Error.message.title", bundle: Bundle(for: Self.self), comment: ""), message: error.localizedDescription)
                }
            }
        }
    }
    
    func loadNextPage()
    {
        self.page += 1
        self.loadData()
    }
    
    private func viewData(index: Int) -> ListViewData.CellViewData
    {
        let model = self.list[index]
        return ListViewData.CellViewData(avatar: model.avatar ?? "",
                                         username: model.username ?? "")
    }
}

private extension ListPresenter
{
    static func buildMainViewData(search: SearchModel) -> ListViewData.MainViewData
    {
        return ListViewData.MainViewData(title: search.repository)
    }
    
    static func buildCellsViewData(stargazers: [StargazerModel]) -> [ListViewData.CellViewData]
    {
        return stargazers.map
        { (stargazer: StargazerModel) -> ListViewData.CellViewData in
            return ListViewData.CellViewData(avatar: stargazer.avatar ?? "",
                                             username: stargazer.username ?? "")
        }
    }
}

extension ListPresenter: ListViewDatasourceProvider
{
    var itemsCount: Int
    {
        return self.list.count
    }
    
    func cellViewData(index: Int) -> ListViewData.CellViewData
    {
        return self.viewData(index: index)
    }
}
