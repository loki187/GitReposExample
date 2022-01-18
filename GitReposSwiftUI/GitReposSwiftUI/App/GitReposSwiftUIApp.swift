//
//  GitReposSwiftUIApp.swift
//  GitReposSwiftUI
//
//  Created by Andrej Lukes on 16/01/2022.
//

import SwiftUI

@main
struct GitReposSwiftUIApp: App {
    
    @StateObject var repoListViewModel = RepoListViewModel()
    
    var body: some Scene {
        WindowGroup {
            RepoListView(viewModel: repoListViewModel)
        }
    }
}
