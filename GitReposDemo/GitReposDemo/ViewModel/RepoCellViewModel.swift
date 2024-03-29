//
//  RepoCellViewModel.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 16/01/2022.
//

import Foundation
import UIKit

//MARK: - Cell view model
class RepoCellViewModel: TableViewCellRepresentable {
    
    var height: CGFloat = UITableView.automaticDimension
    var reuseIdentifier: String = String(describing: RepoCell.self)
    
    //MARK: - Public
    
    var fullName: String
    var desc: String?
    var stars: String
    var updatedAt: String
    var ownerImageUrl: String
    var htmlUrl: String
    
    //MARK: - Init

    init(repo: GitRepository) {
        self.fullName = repo.fullName
        self.desc = repo.desc
        self.stars = "\(repo.stargazersCount)"
        self.updatedAt = repo.formattedUpdateDate
        self.ownerImageUrl = repo.owner.avatarUrl ?? ""
        self.htmlUrl = repo.htmlUrl
    }
}
