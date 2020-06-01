//  UserRepositoriesSnapshotTests.swift
//  SimpleGithubUITests
//
//  Created by Piotr Holub on 01/06/2020.
//

import SnapshotTesting
import XCTest
@testable import SimpleGithub

class UserRepositoriesSnapshotTests: XCTestCase {
    
    var vc: UserRepositoriesViewController!
    
    override func setUp() {
        super.setUp()
        //record = true
        
        let interactor = UserRepositoriesInteractor()
        self.vc = UserRepositoriesViewController(interactor: interactor)
        vc.loadViewIfNeeded()
        interactor.use(renderer: vc)
    }
    
    func testUserRepositoriesEmptyView() {
        vc.setEmptyView()
        assertSnapshot(matching: vc, as: .image)
    }
    
    
}
