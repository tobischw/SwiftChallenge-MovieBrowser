//
//  Movie.swift
//  MovieBrowser
//
//  Created by Tobi Schweiger on 8/30/21.
//

import Foundation

struct Movie: Codable, Equatable {
    var id: Int
    var title: String
    var overview: String
    var popularity: Double
    var posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview, popularity
        case posterPath = "poster_path"
    }
}
