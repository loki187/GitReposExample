//
//  RealGitRepositoryWebService.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 15/01/2022.
//

import Foundation
import Combine

class RealGitRepositoryWebService: WebService {
    
    private var baseUrl: String = "https://api.github.com/"
    
    func getRepositories() -> AnyPublisher<[GitRepository], AppError> {
        let url = URL(string: baseUrl + "users/apple/repos")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { response in
                guard
                    let httpURLResponse = response.response as? HTTPURLResponse,
                    httpURLResponse.statusCode == 200
                else {
                    throw AppError.unknown(description: "Unknown response")
                }
                return response.data
            }
            .decode(type: [GitRepository].self, decoder: JSONDecoder())
            .mapError { AppError.map($0) }
            .eraseToAnyPublisher()
    }
}
