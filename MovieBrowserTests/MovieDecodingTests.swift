//
//  MovieDecodingTests.swift
//  MovieBrowserTests
//
//  Created by Tobi Schweiger on 8/30/21.
//

import XCTest
@testable import MovieBrowser

class MovieDecodingTests: XCTestCase {
    func testDecodeSimpleMovie() throws {
        let movieJSON =
"""
{
      "poster_path": "test.jpg",
      "adult": false,
      "overview": "Description",
      "release_date": "1994-09-10",
      "genre_ids": [
        18,
        80
      ],
      "id": 278,
      "original_title": "The Shawshank Redemption",
      "original_language": "en",
      "title": "The Shawshank Redemption",
      "backdrop_path": "/xBKGJQsAIeweesB79KC89FpBrVr.jpg",
      "popularity": 6.741296,
      "vote_count": 5238,
      "video": false,
      "vote_average": 8.32
    }
"""
        
        let decoder = JSONDecoder()
        let parsedMovie = try! decoder.decode(Movie.self,
                                         from: movieJSON.data(using: .utf8)!)
        
        let movie = Movie(id: 278, title: "The Shawshank Redemption", overview: "Description", popularity: 6.741296, posterPath: "test.jpg")
        
        XCTAssertEqual(parsedMovie, movie, "Movies do not match")
    }
}
