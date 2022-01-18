//
//  MockedGitRepositoryWebService.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 16/01/2022.
//

import Foundation
import Combine

class MockedGitRepositoryWebService: WebService {
    
    private let mockedReposFileName = "MockedRepos.json"
    
    func getRepositories() -> AnyPublisher<[GitRepository], AppError> {
        
        guard let file = Bundle.main.url(forResource: mockedReposFileName, withExtension: nil) else {
            return Fail(error: AppError.localFileLoadingFailed)
                .eraseToAnyPublisher()
        }
        
        guard let data = try? Data(contentsOf: file) else {
            return Fail(error: AppError.localFileLoadingFailed)
                .eraseToAnyPublisher()
        }
        
        guard let repos = try? JSONDecoder().decode([GitRepository].self, from: data) else {
            return Fail(error: AppError.localFileDecodingFailed)
                .eraseToAnyPublisher()
        }
        return Just(repos)
            .setFailureType(to: AppError.self)
            .eraseToAnyPublisher()
    }
}
