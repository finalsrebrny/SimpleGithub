//
//  UserRepositoriesViewController.swift
//  SimpleGithub
//
//  Created by Piotr Holub on 27/05/2020.
//

import UIKit
import Lottie

protocol UserRepositoriesViewRendering: class {
    func reloadTableView()
    func showTableViewIndicator()
    func hideTableViewIndicator()
    func setEmptyView()
    func removeEmptyView()
}

class UserRepositoriesViewController: UIViewController, HavingXib {

    private enum Constants {
        static let indicatorAnimationDuration = 0.4
    }
    
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    private let interactor: UserRepositoriesInteracting

    init (interactor: UserRepositoriesInteracting){
        self.interactor = interactor
        super.init(nibName: UserRepositoriesViewController.xibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.viewDidLoad()
        configureView()
        configureLottie()
    }
    
    func configureView() {
        indicatorView.isHidden = true
        self.indicatorView.alpha = 0
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        UserRepositoriesTableViewCell.register(to: self.tableView)
    }
    
    func configureLottie() {
        let animationView = AnimationView(name: "lottie-github-logo")
        animationView.frame = indicatorView.bounds
        animationView.contentMode = .scaleAspectFit
        indicatorView.addSubview(animationView)
        animationView.loopMode = .loop
        animationView.play()
    }
}

extension UserRepositoriesViewController: UserRepositoriesViewRendering {
    
    func reloadTableView() {
            self.tableView.reloadData()
    }
    
    func showTableViewIndicator() {
        self.indicatorView.isHidden = false
        UIView.animate(withDuration: Constants.indicatorAnimationDuration, animations: {
            self.indicatorView.alpha = 1
        })
    }
    
    func hideTableViewIndicator() {
        UIView.animate(withDuration: Constants.indicatorAnimationDuration, animations: {
            self.indicatorView.alpha = 0
        }, completion: {
            success in
            self.indicatorView.isHidden = true
        })
    }
    
    func setEmptyView() {
            self.tableView.backgroundView = EmptyUserRepositoriesView()
    }
    func removeEmptyView() {
            self.tableView.backgroundView = nil
    }
}

extension UserRepositoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserRepositoriesTableViewCell.xibName) as! UserRepositoriesTableViewCell
        cell.render(with: interactor.item(at: indexPath))
        return cell
    }
    
}

extension UserRepositoriesViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
        interactor.searchBarSearch(text: searchBar.text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        interactor.searchBarTextChange(text: searchText)
    }
}
