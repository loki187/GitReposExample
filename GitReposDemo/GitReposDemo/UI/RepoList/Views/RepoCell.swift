//
//  RepoCell.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 16/01/2022.
//

import Foundation
import UIKit

class RepoCell: UITableViewCell {
    
    private var viewModel: RepoCellViewModel!
    
    @IBOutlet weak var mainView: UIView! {
        didSet {
            mainView.layer.masksToBounds = false
            mainView.layer.cornerRadius = 10
            mainView.layer.shadowColor = UIColor.lightGray.cgColor
            mainView.layer.shadowOffset = CGSize(width: 0, height: 0)
            mainView.layer.shadowOpacity = 0.3
            mainView.layer.shadowRadius = 4.0
        }
    }
    @IBOutlet weak var ownerImage: UIImageView! {
        didSet {
            ownerImage.layer.cornerRadius = ownerImage.bounds.size.height/2
            ownerImage.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var starLabel: UILabel?
    @IBOutlet weak var descLabel: UILabel?
    @IBOutlet weak var updatedLabel: UILabel?
}

// MARK: - Cell Setup
extension RepoCell: Setupable {
    
    public func setup(_ values: Any?) {
        guard let viewModel = values as? RepoCellViewModel else { return }
        self.viewModel = viewModel
        
        self.nameLabel?.text = viewModel.fullName
        self.starLabel?.text = "Stars count: \(viewModel.stars)"
        self.descLabel?.text = viewModel.desc
        self.updatedLabel?.text = "Updated: \(viewModel.formattedUpdateDate)"
    }
}
