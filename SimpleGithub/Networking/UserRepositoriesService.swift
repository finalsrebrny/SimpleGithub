//
//  UserRepositoriesService.swift
//  SimpleGithub
//
//  Created by Piotr Holub on 28/05/2020.
//

import Foundation
import Apollo

class UserRepositoriesService {
    static let shared = UserRepositoriesService()
    
    func getUserRepositories(userName: String,success: @escaping ([RepositoryMethodsQuery.Data.RepositoryOwner.Repository.Node?]) -> Void, failure: @escaping (String) -> Void) {
        ApolloProvider.shared.apollo?.fetch(query: RepositoryMethodsQuery(login: userName)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if graphQLResult.errors == nil {
                    if let repositories = graphQLResult.data?.repositoryOwner?.repositories.nodes {
                        success(repositories)
                    } else {
                        success([])
                    }
                }
                else {
                    failure(graphQLResult.errors?.first?.message ?? "")
                }
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
        
    }


}
