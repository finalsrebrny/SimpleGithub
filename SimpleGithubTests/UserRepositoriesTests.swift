//
//  UserRepositoriesTests.swift
//  SimpleGithubTests
//
//  Created by Piotr Holub on 01/06/2020.
//

@testable import SimpleGithub
import XCTest

class UserRepositoriesTests: XCTestCase {
    
    var interactor: UserRepositoriesInteractor!

    var repositories: [RepositoryMethodsQuery.Data.RepositoryOwner.Repository.Node?] = []
    
    override func setUp() {
        super.setUp()
        interactor = UserRepositoriesInteractor()
        let language = RepositoryMethodsQuery.Data.RepositoryOwner.Repository.Node.PrimaryLanguage(name: "Swift")
        let stargazer = RepositoryMethodsQuery.Data.RepositoryOwner.Repository.Node.Stargazer(totalCount: 1000)
        let repository = RepositoryMethodsQuery.Data.RepositoryOwner.Repository.Node(name: "SimpleGithub", primaryLanguage: language, stargazers: stargazer, isFork: false)
        interactor.repositories = [repository]
        repositories = [repository]
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testGenerateShouldReturnRepoTitle()
    {
        let renderable = interactor.item(at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(renderable.repoTitle, "SimpleGithub")
    }
    
    func testGenerateShouldReturnStargazerCount()
    {
        let renderable = interactor.item(at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(renderable.stargazersCount, 1000)
    }
    
    func testGenerateShouldReturnLogo()
    {
        let renderable = interactor.item(at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(renderable.techLogoImage, Logo.swift)
    }

}

