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
    case unknown(description: String)
    case localFileLoadingFailed
    case localFileDecodingFailed

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
        case .unknown(let value):
            return value
        case .localFileLoadingFailed:
            return "Couldn't find file in main bundle."
        case .localFileDecodingFailed:
            return "Couldn't decode file."
        }
    }
    
    static func map(_ error: Error) -> AppError {
        return (error as? AppError) ?? .unknown(description: "Unknown error")
    }
}
