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
}

class UserRepositoriesInteractor: UserRepositoriesInteracting {
    
    private weak var renderer: UserRepositoriesViewRendering!

    func viewDidLoad() {
        getUserRepositories(userName: "")
    }
    
    func getUserRepositories(userName: String) {
        UserRepositoriesService.shared.getUserRepositories(userName: userName, success: {
            repositories in
            
        }, failure: {
            error in
            
        })
    }
    
    func use(renderer: UserRepositoriesViewRendering) {
        self.renderer = renderer
    }
    
    
}
