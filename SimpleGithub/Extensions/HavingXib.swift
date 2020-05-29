//
//  HavingXib.swift
//  SimpleGithub
//
//  Created by Piotr Holub on 27/05/2020.
//

import UIKit

protocol HavingXib: AnyObject {
    static var xibName: String { get }
}

extension HavingXib where Self : UIView {

    static func fromNib(translatesAutoresizingMaskIntoConstraints: Bool = true) -> Self {
        guard let view = xib().instantiate(withOwner: nil, options: nil).first(where: { $0 is Self }) as? Self
            else { fatalError("No nib named: \(xibName)") }
        view.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return view
    }

    static func xib() -> UINib {
        return UINib(nibName: xibName, bundle: nil)
    }
}

extension HavingXib {
    static var xibName: String {
        return String(describing: self)
    }
}

protocol HavingReuseIdentifier: AnyObject {
    static var reuseIdentifier: String { get }
}

extension UITableViewCell: HavingXib, HavingReuseIdentifier { }

extension HavingXib where Self: UITableViewCell {

    static func register(to tableView: UITableView) {
        tableView.register(xib(), forCellReuseIdentifier: reuseIdentifier)
    }
}

extension HavingReuseIdentifier where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
