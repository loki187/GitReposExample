//
//  RealGitRepositoryWebService.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 15/01/2022.
//

import Foundation

class RealGitRepositoryWebService: WebService {
    
    private var baseUrl: String = "https://api.github.com/"
    
    /// Downlading of repositories from Github
    func getRepositories(completion: @escaping (Result<[GitRepository], AppError>) -> ()) {
        
        let suffix = "users/apple/repos"
        guard let fullUrl = URL(string: baseUrl + suffix) else {
            return completion(.failure(AppError.url(description: "URL creation failed.")))
        }
        
        URLSession.shared.dataTask(with: fullUrl) { (data, response, error) in
            guard let data = data else {
                return completion(.failure(AppError.noData(description: "No data received.")))
            }
            do {
                let repos = try JSONDecoder().decode([GitRepository].self, from: data)
                return completion(.success(repos))
            } catch let error {
                print("Get repos, error: ", error)
                return completion(.failure(AppError.getRepositoriesFailed(description: "Downloading failed...")))
            }
        }.resume()
    }
}
