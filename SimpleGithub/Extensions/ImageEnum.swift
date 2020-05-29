//
//  ImageEnum.swift
//  SimpleGithub
//
//  Created by Piotr Holub on 28/05/2020.
//

import Foundation
import UIKit

enum Logo: String {
    case github = "default"
    case swift = "Swift"
    case java = "Java"
    case javascript = "JavaScript"
    
    var image: UIImage {
        switch self {
            case .github: return UIImage(named: "github-original.png")!
            case .swift: return UIImage(named: "swift-original.png")!
            case .java: return UIImage(named: "java-original.png")!
            case .javascript: return UIImage(named: "javascript-original.png")!
        }
    }
}


