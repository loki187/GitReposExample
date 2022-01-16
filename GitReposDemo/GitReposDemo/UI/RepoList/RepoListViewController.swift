//
//  RepoListViewController.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 15/01/2022.
//

import Foundation
import UIKit

class RepoListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    
    let viewModel = RepoListViewModel()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()
        bindViewModel()
        viewModel.getGitRepositories()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UI methods
    
    private func customizeUI() {
        self.title = "Apple repositories"
        self.navigationController?.navigationBar.prefersLargeTitles = true

        tableView?.registerCell(LoadingCell.self)
        tableView?.registerCell(ErrorCell.self)
        tableView?.estimatedRowHeight = 100
        tableView?.tableFooterView = UIView()
    }
    
    // MARK: - Bindings
    
    private func bindViewModel() {
        self.viewModel.delegate = self
    }
    
    // MARK: - Navigation
    
    private func openWebView(url: String) {
        let storyboard = UIStoryboard.storyboard("Main")
        let vc = storyboard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        vc.contentUrl = URL(string: url)!
        self.present(vc, animated: true)
    }
}

// MARK: - View model delegate
extension RepoListViewController: RepoListViewModelDelegate {
    
    func dataDownloadFinished() {
        self.tableView?.reloadData()
    }
}

// MARK: - Table view delegate and data source
extension RepoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cell(indexPath: indexPath, viewModel: self.viewModel.cells[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedItem = viewModel.cells[indexPath.row] as? RepoCellViewModel {
            self.openWebView(url: selectedItem.htmlUrl)
        }
    }
}
