//
//  File.swift
//  
//
//  Created by Fep on 18/07/24.
//

import Foundation
import Alamofire

public class RequestLogger: RequestInterceptor {
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var modifiedRequest = urlRequest
        // Perform any modifications to the request here, if needed
        completion(.success(modifiedRequest))
    }
    
    public func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        // Handle retry logic here, if needed
        completion(.doNotRetry)
    }
    
    func requestDidResume(_ request: Request) {
        if let urlRequest = request.request {
            print("--> \(urlRequest.httpMethod ?? "") \(urlRequest.url?.absoluteString ?? "")")
        }
    }
    
    func request(_ request: DataRequest, didParseResponse response: DataResponse<Any, AFError>) {
        // Optional: Handle parsing of response if needed
    }
    
    func request(_ request: DataRequest, didCompleteWithError error: AFError?) {
        if let urlRequest = request.request {
            if let error = error {
                print("<-- \(urlRequest.httpMethod ?? "") \(urlRequest.url?.absoluteString ?? "") Error: \(error)")
            } else {
                print("<-- \(urlRequest.httpMethod ?? "") \(urlRequest.url?.absoluteString ?? "") Completed")
            }
        }
    }
}

public class AlamofireLogger {
    
    public static let shared = AlamofireLogger()
    
    private let session: Session
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        let interceptor = RequestLogger()
        self.session = Session(configuration: configuration, interceptor: interceptor)
    }
    
    public func request(_ urlString: String, parameters: [String: Any]? = nil) -> DataRequest {
        var apiParams: [String: Any] = ["api_key": API.apiKey]
        if let params = parameters{
            for key in params.keys {
                apiParams[key] = params[key]
            }
        }
        print("url \(urlString)  | apiParams \(apiParams)")
        return session.request(urlString, parameters: apiParams)
    }
}
