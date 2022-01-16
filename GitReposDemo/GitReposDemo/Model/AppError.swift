//
//  AppError.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 15/01/2022.
//

import Foundation

enum AppError: Error, Equatable {
    case noData(description: String)
    case url(description: String)
    case getRepositoriesFailed(description: String)
    case network(description: String)

    var description: String {
        switch self {
        case .noData(let value):
            return value
        case .url(let value):
            return value
        case .getRepositoriesFailed(let value):
            return value
        case .network(let value):
            return value
        }
    }
}
