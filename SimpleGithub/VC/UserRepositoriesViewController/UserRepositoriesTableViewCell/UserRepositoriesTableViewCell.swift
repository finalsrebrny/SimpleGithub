//
//  UserRepositoriesTableViewCell.swift
//  SimpleGithub
//
//  Created by Piotr Holub on 27/05/2020.
//

import UIKit

struct UserRepositoriesTableViewCellRenderable {
    let techLogoImage: Logo
    let repoTitle: String
    let stargazersCount: Int
}

class UserRepositoriesTableViewCell: UITableViewCell {

    private enum Constants {
        static let stargazersTextPrefix = "Stargazers: "
    }
    
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var stargazersLabel: UILabel!
    @IBOutlet weak var techLogoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func render(with renderable: UserRepositoriesTableViewCellRenderable) {
        techLogoImageView.image = renderable.techLogoImage.image
        repoNameLabel.text = renderable.repoTitle
        stargazersLabel.text = Constants.stargazersTextPrefix + String(renderable.stargazersCount)
    }
    
}
