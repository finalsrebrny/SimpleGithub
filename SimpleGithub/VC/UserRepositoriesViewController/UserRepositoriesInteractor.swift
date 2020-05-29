//
//  UserRepositoriesInteractor.swift
//  SimpleGithub
//
//  Created by Piotr Holub on 27/05/2020.
//

import Foundation

protocol UserRepositoriesInteracting {
    func viewDidLoad()
    func use(renderer: UserRepositoriesViewRendering)
    func item(at indexPath: IndexPath) -> UserRepositoriesTableViewCellRenderable
    func numberOfRows() -> Int
    func searchBarSearch(text: String?)
    func searchBarTextChange(text: String)
}

class UserRepositoriesInteractor: UserRepositoriesInteracting {
    
    private weak var renderer: UserRepositoriesViewRendering!
    
    var repositories: [RepositoryMethodsQuery.Data.RepositoryOwner.Repository.Node?] = []
    
    func viewDidLoad() {
    }
    
    func numberOfRows() -> Int {
        return repositories.count
    }
    
    func item(at indexPath: IndexPath) -> UserRepositoriesTableViewCellRenderable {
        let renderable = UserRepositoriesTableViewCellRenderable(techLogoImage: getLogoForLanguague(name: repositories[indexPath.row]?.primaryLanguage?.name ?? ""), repoTitle: repositories[indexPath.row]?.name ?? "", stargazersCount: repositories[indexPath.row]?.stargazers.totalCount ?? 0)
        return renderable
    }
    
    private func getLogoForLanguague(name: String) -> Logo {
        return Logo(rawValue: name) ?? Logo.github
    }
    
    func searchBarSearch(text: String?) {
        if let text = text {
            getUserRepositories(userName: text)
        }
    }
    
    func searchBarTextChange(text: String) {
        self.repositories = []
        self.renderer.reloadTableView()
        self.chooseRenderEmptyView()
        getUserRepositories(userName: text)
    }
    
    private func getUserRepositories(userName: String) {
        renderer.showTableViewIndicator()
        UserRepositoriesService.shared.getUserRepositories(userName: userName, success: {
            repositories in
            DispatchQueue.main.async {
                self.repositories = self.filterForkedRepos(repositories: repositories)
                self.renderer.hideTableViewIndicator()
                self.chooseRenderEmptyView()
                self.renderer.reloadTableView()
            }
        }, failure: {
            error in
            DispatchQueue.main.async {
                self.renderer.showAlert(message: error)
                self.repositories = []
                self.renderer.hideTableViewIndicator()
                self.chooseRenderEmptyView()
                self.renderer.reloadTableView()
            }
        })
    }
    
    private func filterForkedRepos(repositories: [RepositoryMethodsQuery.Data.RepositoryOwner.Repository.Node?]) -> [RepositoryMethodsQuery.Data.RepositoryOwner.Repository.Node?] {
        return repositories.filter({!($0!.isFork)})
    }
    
    private func chooseRenderEmptyView() {
        if repositories.count > 0 {
            self.renderer.removeEmptyView()
        } else {
            self.renderer.setEmptyView()
        }
    }
    
    func use(renderer: UserRepositoriesViewRendering) {
        self.renderer = renderer
    }
    
}
