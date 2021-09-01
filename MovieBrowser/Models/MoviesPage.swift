//
//  MoviesPage.swift
//  MovieBrowser
//
//  Created by Tobi Schweiger on 8/30/21.
//

import Foundation

struct MoviesPage: Codable {
    var page: Int
    var results: [Movie]
}
