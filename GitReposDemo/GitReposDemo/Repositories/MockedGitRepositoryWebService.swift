//
//  MockedGitRepositoryWebService.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 16/01/2022.
//

import Foundation

class MockedGitRepositoryWebService: WebService {
        
    func getRepositories(completion: @escaping (Result<[GitRepository], AppError>) -> ()) {
        let repos: [GitRepository] = JSONLoader.load("MockedRepos.json")
        return completion(.success(repos))
    }
}
