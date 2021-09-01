//
//  Storyboarded.swift
//  MovieBrowser
//
//  Created by Tobi Schweiger on 9/1/21.
//

import UIKit

protocol Storyboarded {
    static func instantiated() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiated() -> Self {
        let name = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: name) as! Self
    }
}
