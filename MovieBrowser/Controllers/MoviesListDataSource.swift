//
//  MoviesListDataSource.swift
//  MovieBrowser
//
//  Created by Tobi Schweiger on 8/30/21.
//

import UIKit

class MoviesListDataSource: NSObject, UITableViewDataSource {
    let sorting: MoviesSortType
    var movies = [Movie]()
    
    let endpoints = Endpoints()
    
    init(sorting: MoviesSortType) {
        self.sorting = sorting
    }
}

// MARK: - Load Movies

extension MoviesListDataSource {
    func loadMovies(completion: @escaping () -> ()) {
        guard let url = endpoints.listMovies(sorting) else {
            fatalError("Could not assemble endpoint URL for listing movies")
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                fatalError("Error fetching: \(error!.localizedDescription)")
            }
            
            let decoder = JSONDecoder()
            if let result = try? decoder.decode(MoviesPage.self, from: data) {
                self.movies = result.results
                completion()
            }
        }
        task.resume()
    }
}

// MARK: - UITableViewDataSource

extension MoviesListDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movies[indexPath.row]
        
        cell.titleLabel.text = movie.title
        cell.descriptionLabel.text = movie.overview
        cell.ratingLabel.text = movie.popularity.formatted()
        
        return cell
    }
}
