//
//  Coordinator.swift
//  MovieBrowser
//
//  Created by Tobi Schweiger on 9/1/21.
//

import UIKit

public protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}
