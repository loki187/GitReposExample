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
    
    var formattedUpdateDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterString = DateFormatter()
        dateFormatterString.dateFormat = "dd.MM.yyyy HH:mm"
        if let date = dateFormatter.date(from: updatedAt) {
            return dateFormatterString.string(from: date)
        }
        return "N/A"
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
