//
//  SearchPresenter.swift
//  Directory
//
//  Created by daniele on 17/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation
import Common

public protocol SearchPresenterViewProtocol: class
{
    func updateMain(viewData: SearchViewData.MainViewData)
    func updateEditing(viewData: SearchViewData.EditingViewData)
}

public protocol SearchPresenterCoordinatorProtocol: class
{
    func navigateToList(search: SearchModel)
    func navigateToError(title: String, message: String)
}

public class SearchPresenter
{
    public enum ErrorMessage
    {
        case mandatory(input: String)
        case withoutWhitespace(input: String)
        
        func errorMessage() -> String
        {
            switch self
            {
            case .mandatory(let input):
                return input + ": " + NSLocalizedString("Validator.rule.mandatory.error", bundle: Bundle(for: SearchPresenter.self), comment: "")
            case .withoutWhitespace(let input):
                return input + ": " + NSLocalizedString("Validator.rule.withoutWhitespaces.error", bundle: Bundle(for: SearchPresenter.self), comment: "")
            }
        }
    }
    
    fileprivate weak var viewDelegate: SearchPresenterViewProtocol?
    fileprivate weak var coordinatorDelegate: SearchPresenterCoordinatorProtocol?
    fileprivate let validatorOwner: ValidationProtocol
    fileprivate let validatorRepository: ValidationProtocol
    
    internal var ownerErrorMessages = [ErrorMessage.mandatory(input: "owner").errorMessage(),
                                       ErrorMessage.withoutWhitespace(input: "owner").errorMessage()]
    internal var repositoryErrorMessages = [ErrorMessage.mandatory(input: "repository").errorMessage(),
                                            ErrorMessage.withoutWhitespace(input: "repository").errorMessage()]
    
    init(viewDelegate: SearchPresenterViewProtocol?,
         coordinatorDelegate: SearchPresenterCoordinatorProtocol?)
    {
        self.viewDelegate = viewDelegate
        self.coordinatorDelegate = coordinatorDelegate
        self.validatorOwner = Validator(rules: [ValidationMandatoryRule(),
                                                ValidationWithoutWhitespaceRule()])
        self.validatorRepository = Validator(rules: [ValidationMandatoryRule(),
                                                     ValidationWithoutWhitespaceRule()])
    }
    
    func loadData()
    {
        self.viewDelegate?.updateMain(viewData: Self.buildMainViewData())
        self.viewDelegate?.updateEditing(viewData: Self.buildEditingViewData())
    }
    
    func search(owner: String, repository: String)
    {
        self.validate(owner: owner, repository: repository)
    }
    
    func reset()
    {
        self.viewDelegate?.updateEditing(viewData: Self.buildEditingViewData())
    }
}

private extension SearchPresenter
{
    func validate(owner: String, repository: String)
    {
        let ownerResult = self.validatorOwner.validate(input: owner)
        let repositoryResult = self.validatorRepository.validate(input: repository)
        if ownerResult.isValid && repositoryResult.isValid
        {
            self.coordinatorDelegate?.navigateToList(search: SearchModel(owner: owner, repository: repository))
        }
        else
        {
            // TODO manage configuration error messages coupled with Validator
            
            let ownerMessages = ownerResult.results.enumerated().reduce([])
            { [weak self] (result: [String], element: (index: Int, value: Bool)) -> [String] in
                guard let self = self else { return result }
                guard !element.value else { return result }
                return element.index < self.ownerErrorMessages.count ? result + [self.ownerErrorMessages[element.index]] : result
            }
            
            let repositoryMessages = repositoryResult.results.enumerated().reduce([])
            { [weak self] (result: [String], element: (index: Int, value: Bool)) -> [String] in
                guard let self = self else { return result }
                guard !element.value else { return result }
                return element.index < self.repositoryErrorMessages.count ? result + [self.repositoryErrorMessages[element.index]] : result
            }
            
            let globalMessage = (ownerMessages + repositoryMessages).joined(separator: ",\n")
            self.coordinatorDelegate?.navigateToError(title: NSLocalizedString("Error.message.title", bundle: Bundle(for: Self.self), comment: ""), message: globalMessage)
        }
    }
}

private extension SearchPresenter
{
    static func buildMainViewData() -> SearchViewData.MainViewData
    {
        return SearchViewData.MainViewData(title: NSLocalizedString("search.title", bundle: Bundle(for: Self.self), comment: ""),
                                           owner: NSLocalizedString("search.owner.label", bundle: Bundle(for: Self.self), comment: ""),
                                           repository: NSLocalizedString("search.repository.label", bundle: Bundle(for: Self.self), comment: ""),
                                           search: NSLocalizedString("search.button.label", bundle: Bundle(for: Self.self), comment: ""))
    }
    
    static func buildEditingViewData() -> SearchViewData.EditingViewData
    {
        return SearchViewData.EditingViewData(owner: "",
                                              repository: "")
    }
}

