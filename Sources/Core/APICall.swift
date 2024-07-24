//
//  File.swift
//  
//
//  Created by Fep on 18/07/24.
//

import Foundation

public struct API {
    static let baseUrl = "https://api.themoviedb.org/3"
    static let apiKey = "e3ea2cdc09b8b8695cedb54c0e54affd"
}

protocol Endpoint {
    var url: String { get }
}

public enum Endpoints {
    
    public enum Gets: Endpoint {
        case nowPlaying
        case upcoming
        case topRated
        case popular
        case movie
        case search
        case movies
        
        public var url: String {
            switch self {
            case .movies: return "\(API.baseUrl)/movie/"
            case .nowPlaying: return "\(API.baseUrl)/movie/now_playing"
            case .upcoming: return "\(API.baseUrl)/movie/now_playing"
            case .topRated: return "\(API.baseUrl)/movie/top_rated"
            case .popular: return "\(API.baseUrl)/movie/now_playing"
            case .movie: return "\(API.baseUrl)/movie/"
            case .search: return "\(API.baseUrl)/search/movie?"
            }
        }
    }
}
