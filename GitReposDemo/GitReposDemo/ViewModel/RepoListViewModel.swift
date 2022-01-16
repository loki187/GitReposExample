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
    
    init(gitRepoService: WebService = RealGitRepositoryWebService()) {
        self.gitRepoService = gitRepoService
    }
    
    // MARK: - Public methods
    
    func getGitRepositories() {
        prepareLoadingCell()
        self.gitRepoService.getRepositories { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    print("Received reponse \(response)")
                    self?.createDataSource(response)
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    self?.prepareErrorCell(error: error)
                }
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
    
    private func prepareLoadingCell() {
        cells.removeAll()
        self.cells.append(LoadingCellViewModel())
    }
    
    private func prepareErrorCell(error: AppError) {
        cells.removeAll()
        self.cells.append(ErrorCellViewModel(message: error.localizedDescription))
    }
}
