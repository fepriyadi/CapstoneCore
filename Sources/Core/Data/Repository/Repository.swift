//
//  File.swift
//  
//
//  Created by Fep on 15/07/24.
//

import Combine

public protocol Repository {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> AnyPublisher<Response, Error>
    func get(id: Int) -> AnyPublisher<Response, Error>
    func update(entity: Response) -> AnyPublisher<Response, Error>
    func add(entity: Response) -> AnyPublisher<Response, Error>
    func remove(entity: Response) -> AnyPublisher<Response, Error>
}
