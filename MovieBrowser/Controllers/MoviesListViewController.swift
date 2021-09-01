//
//  ViewController.swift
//  MovieBrowser
//
//  Created by Tobi Schweiger on 8/30/21.
//

import UIKit

class MoviesListViewController: UITableViewController {
    let dataSource = MoviesListDataSource(sorting: .popular)

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
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

