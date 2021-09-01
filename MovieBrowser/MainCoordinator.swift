//
//  MainCoordinator.swift
//  MovieBrowser
//
//  Created by Tobi Schweiger on 9/1/21.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - Coordination

extension MainCoordinator {
    func start() {
        let vc = MoviesListViewController.instantiated()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showDetail(for movie: Movie) {
        let vc = MovieDetailViewController.instantiated()
        
        vc.coordinator = self
        vc.movie = movie
        
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(vc, animated: true)
    }
}
