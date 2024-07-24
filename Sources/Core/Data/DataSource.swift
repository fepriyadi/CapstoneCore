//
//  File.swift
//  
//
//  Created by Fep on 15/07/24.
//

import Combine

public protocol DataSource {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> AnyPublisher<Response, Error>
}
