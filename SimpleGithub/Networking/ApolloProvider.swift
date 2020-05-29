//
//  ApolloProvider.swift
//  SimpleGithub
//
//  Created by Piotr Holub on 28/05/2020.
//

import Foundation
import Apollo

class ApolloProvider {
    
    static var shared = ApolloProvider()
    var apollo:ApolloClient? = nil
    
    init() {
        self.apollo = self.createApolloInstance(token: GITHUB_TOKEN)
    }
    
    private func createApolloInstance(token: String) -> ApolloClient {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        let transport = HTTPNetworkTransport(url: URL(string: API_URL)!, client: URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil))
        return ApolloClient(networkTransport: transport)
    }
}
