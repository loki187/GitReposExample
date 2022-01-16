//
//  RepoListViewModel.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 15/01/2022.
//

import Foundation

protocol RepoListViewModelDelegate: AnyObject {
    func dataDownloadFinished()
}

class RepoListViewModel {
   
    //MARK: - Public properties
    public var cells: [TableViewCellRepresentable] = []
    public weak var delegate : RepoListViewModelDelegate?
    
    //MARK: - Private properties
    private let gitRepoService: WebService
   
    // MARK: - Init
    
    init(gitRepoService: WebService = MockedGitRepositoryWebService()) {
        self.gitRepoService = gitRepoService
    }
    
    // MARK: - Public methods
    
    func getGitRepositories() {
        self.gitRepoService.getRepositories { [weak self] result in
            switch result {
            case .success(let response):
                print("received reponse \(response)")
                self?.createDataSource(response)
            case .failure(let error):
                print("error \(error.localizedDescription)")
                //self?.isError = true
            }
        }
    }
    
    // MARK: - Private methods
    
    private func createDataSource(_ items: [GitRepository]) {
        cells = [TableViewCellRepresentable]()
        for item in items {
            let cellVM = RepoCellViewModel(repo: item)
            cells.append(cellVM)
        }
        delegate?.dataDownloadFinished()
    }
}
