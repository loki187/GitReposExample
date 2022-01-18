//
//  WebServiceProtocol.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 15/01/2022.
//

import Foundation
import Combine

protocol WebService {
    func getRepositories() -> AnyPublisher<[GitRepository], AppError>
}
