//
//  GitRepository.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 15/01/2022.
//

import Foundation

struct GitRepository: Codable, Identifiable {
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
        
        var avatarUrlFormatted: URL? {
            if avatarUrl != nil {
                return URL(string: avatarUrl!)
            }
            return nil
        }
        
        enum CodingKeys: String, CodingKey {
            case id
            case avatarUrl = "avatar_url"
        }
    }
}

#if DEBUG

extension GitRepository {
    
    static let mockedData: [GitRepository] = [
        GitRepository(id: 1234,
                      fullName: "Test repo",
                      desc: "Test description",
                      updatedAt: "2022-01-12T16:38:01Z",
                      stargazersCount: 150,
                      htmlUrl: "https://github.com/apple/apple-llvm-infrastructure-tools",
                      owner: Owner(id: 1,
                                   avatarUrl: "https://avatars.githubusercontent.com/u/10639145?v=4")),
        GitRepository(id: 12345,
                      fullName: "Test repo 2",
                      desc: "Test description 2",
                      updatedAt: "2022-01-12T16:38:01Z",
                      stargazersCount: 150,
                      htmlUrl: "https://github.com/apple/apple_rules_lint",
                      owner: Owner(id: 2,
                                   avatarUrl: "https://avatars.githubusercontent.com/u/10639145?v=4")),
    ]
}

#endif
