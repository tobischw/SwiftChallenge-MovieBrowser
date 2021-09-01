//
//  ViewController.swift
//  MovieBrowser
//
//  Created by Tobi Schweiger on 8/30/21.
//

import UIKit

class MoviesListViewController: UITableViewController, Storyboarded {
    let dataSource = MoviesListDataSource(sorting: .popular)
    
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.estimatedRowHeight = 200

        dataSource.loadMovies() {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension MoviesListViewController {
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = dataSource.movies[indexPath.row]
        coordinator?.showDetail(for: movie)
    }
}

