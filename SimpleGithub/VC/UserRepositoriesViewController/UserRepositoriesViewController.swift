//
//  UserRepositoriesViewController.swift
//  SimpleGithub
//
//  Created by Piotr Holub on 27/05/2020.
//

import UIKit

protocol UserRepositoriesViewRendering: class {
    func render(with renderable: [UserRepositoriesTableViewCellRenderable])
    func showNoFoundView()
    func showTableViewIndicator()
}

class UserRepositoriesViewController: UIViewController, HavingXib {

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
        configureTableView()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        UserRepositoriesTableViewCell.register(to: self.tableView)

    }

}

extension UserRepositoriesViewController: UserRepositoriesViewRendering {
    func showNoFoundView() {
        
    }
    
    func showTableViewIndicator() {
        
    }

}

extension UserRepositoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserRepositoriesTableViewCell.xibName) as! UserRepositoriesTableViewCell
        cell.render(with: UserRepositoriesTableViewCellRenderable(techLogoImageUrl: "", repoTitle: "title", stargazersCount: 5))
        return cell
    }
    
}
