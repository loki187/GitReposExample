//
//  RepoListView.swift
//  GitReposSwiftUI
//
//  Created by Andrej Lukes on 16/01/2022.
//

import SwiftUI

struct RepoListView: View {
    
    @ObservedObject var viewModel: RepoListViewModel
    @State private var presentWebViewSheet = false
    
    var body: some View {
        
        NavigationView{
            VStack {
                switch viewModel.state {
                case .idle:
                    Color.clear.onAppear(perform: viewModel.getGitRepositories)
                case .loading:
                    ProgressView()
                case .failed(let error):
                    VStack {
                        Text("\(error.localizedDescription)")
                    }
                case .loaded(let repositories):
                    List {
                        ForEach(repositories) { repo in
                            NavigationLink {
                                CustomWebView(url: URL(string: repo.htmlUrl)!)
                            } label: {
                                RepoItemRow(item: repo)
                            }
                        }
                    }
                    Spacer()
                }
            }
            .navigationTitle("Apple repositories")
        }
    }
}

struct RepoListView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView(viewModel: RepoListViewModel())
    }
}
