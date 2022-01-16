//
//  GitRepository.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 15/01/2022.
//

import Foundation

struct GitRepository: Codable {
    var id: Int
    var fullName: String
    var desc: String?
    var updatedAt: String
    var stargazersCount: Int
    var htmlUrl: String
    var owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case desc = "description"
        case updatedAt = "updated_at"
        case stargazersCount = "stargazers_count"
        case htmlUrl = "html_url"
        case owner
    }
}

extension GitRepository {
    struct Owner: Codable {
        var id: Int
        var avatarUrl: String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case avatarUrl = "avatar_url"
        }
    }
}
