//
//  Router.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 15/01/2022.
//

import UIKit

class Router {
    
    static func prepareGitReposListNavigationController() -> UINavigationController {
        let introVC = RepoListViewController.init()
        let nvc = UINavigationController()
        nvc.viewControllers = [introVC]
        return nvc
    }
}
