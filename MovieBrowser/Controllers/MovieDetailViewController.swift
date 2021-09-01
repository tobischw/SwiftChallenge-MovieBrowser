//
//  MovieDetailViewController.swift
//  MovieBrowser
//
//  Created by Tobi Schweiger on 9/1/21.
//

import UIKit

class MovieDetailViewController: UIViewController, Storyboarded {
    @IBOutlet var descriptionLabel: UILabel!
    
    var movie: Movie?
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        title = movie?.title
        descriptionLabel.text = movie?.overview
    }
}
