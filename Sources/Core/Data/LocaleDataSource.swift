//
//  File.swift
//  
//
//  Created by Fep on 15/07/24.
//

import Combine

public protocol LocaleDataSource {
    associatedtype Request
    associatedtype Response
    
    func list(request: Request?) -> AnyPublisher<[Response], Error>
    func addlist(entities: [Response]) -> AnyPublisher<[Response], Error>
    func add(entity: Response) -> AnyPublisher<Response, Error>
    func get(id: Int) -> AnyPublisher<Response, Error>
    func update(entity: Response) -> AnyPublisher<Response, Error>
}
