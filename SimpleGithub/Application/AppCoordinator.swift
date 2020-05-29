//
//  AppCoordinator.swift
//  SimpleGithub
//
//  Created by Piotr Holub on 27/05/2020.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

class AppCoordinator: Coordinator {
    
    private enum Constants {
        static let githubMainColor = UIColor(red: 36/255, green: 41/255, blue: 46/255, alpha: 1)
        static let navigationBarTintColor = UIColor.white
        static let userRepositoriesVCTitle = "Simple Github"
    }
    
    private var window = UIWindow(frame: UIScreen.main.bounds)
    
    var navigationController = LightContentNavigationController() as! UINavigationController
    
    public var rootViewController: UIViewController {
        return navigationController
    }
    
    func start() {
        configureNavigationBar()
        showMain()
    }
    
    private func configureNavigationBar() {
        self.navigationController.navigationBar.isHidden = false
        self.navigationController.navigationBar.barTintColor = Constants.githubMainColor
        self.navigationController.navigationBar.tintColor = Constants.navigationBarTintColor
        let textAttributes = [NSAttributedString.Key.foregroundColor: Constants.navigationBarTintColor]
        self.navigationController.navigationBar.titleTextAttributes = textAttributes
    }
    
    private func showMain() {
        self.navigationController.pushViewController(prepareUserRepositoriesVC(), animated: true)
    }
    
    private func prepareUserRepositoriesVC() -> UserRepositoriesViewController {
        let interactor = UserRepositoriesInteractor()
        let vc = UserRepositoriesViewController(interactor: interactor)
        vc.title = Constants.userRepositoriesVCTitle
        interactor.use(renderer: vc)
        return vc
    }
}

class LightContentNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

