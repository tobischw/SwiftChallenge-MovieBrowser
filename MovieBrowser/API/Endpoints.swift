//
//  Endpoints.swift
//  MovieBrowser
//
//  Created by Tobi Schweiger on 8/30/21.
//

import Foundation

struct Endpoints {
    private let authKey = "9ce1882e2b62bbb26759c85b9fbb3efa"
    
    var baseComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3"
        components.queryItems = [ URLQueryItem(name: "api_key", value: authKey) ]
        return components
    }
}

extension Endpoints {
    func listMovies(_ sortType: MoviesSortType) -> URL? {
        guard let baseURL = baseComponents.url else { return nil }
        return baseURL.appendingPathComponent("/movie/\(sortType.rawValue)")
    }
}

enum MoviesSortType: String {
    case latest = "latest"
    case topRated = "top_rated"
    case popular = "popular"
    case upcoming = "upcoming"
}
