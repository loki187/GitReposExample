//
//  RepoListViewModel.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 15/01/2022.
//

import Foundation
import Combine

class RepoListViewModel: ObservableObject {
    
    @Published private(set) var state = ContentState.idle
    
    // MARK: - Private properties
    
    private let gitRepoService: WebService
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: - Init
    
    init(gitRepoService: WebService = MockedGitRepositoryWebService()) {
        self.gitRepoService = gitRepoService
    }
    
    // MARK: - Public methods
    
    func getGitRepositories() {
        state = .loading
        self.gitRepoService.getRepositories()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error during downloading of data: \(error.localizedDescription)")
                    self.state = .failed(error)
                }
            }, receiveValue: { repos in
                // data received
                self.state = .loaded(repos)
            })
            .store(in: &subscriptions)
    }
}
