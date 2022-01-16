//
//  WebServiceProtocol.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 15/01/2022.
//

import Foundation

protocol WebService {
    func getRepositories(completion: @escaping (Result<[GitRepository], AppError>) -> ())
}
