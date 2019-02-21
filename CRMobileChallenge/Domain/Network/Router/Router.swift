//
//  Router.swift
//  Domain
//
//  Created by Adriano Souza Costa on 16/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//


final class Router<EndPoint: EndPointType>: NetworkRouter {
    
    // MARK: - Private Variables
    
    private var task: URLSessionTask?
    
    // MARK: - Public Methods
    
    func request<T: Decodable>(_ route: EndPoint, completion: @escaping NetworkRouterCompletion<T>) {
        let session = URLSession.shared
        
        do {
            let request = try self.buildRequest(from: route)
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            NetworkLogger.log(request: request)
            
            task = session.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    switch self.handleNetworkResponse(response) {
                    case .success:
                        guard let data = data, !data.isEmpty else { return completion(nil, response, nil) }
                        
                        do {
                            completion(try JSONDecoder().decode(T.self, from: data), response, nil)
                        } catch {
                            completion(nil, response, error)
                        }
                    case .failure(let error):
                        completion(nil, response, error)
                    }
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        } catch {
            completion(nil, nil, error)
        }
        
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    // MARK: - Private Methods
    
    private func buildRequest(from route: EndPoint) throws -> URLRequest {
        var request = URLRequest(
            url: route.baseURL.appendingPathComponent(route.path),
            cachePolicy: route.cachePolicy,
            timeoutInterval: route.timeoutInterval)
        
        request.httpMethod = route.httpMethod.rawValue
        
        addAdditionalHeaders(route.headers, request: &request)
        
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(let bodyParameters, let bodyEncoding, let urlParameters):
                try self.configureParameters(bodyParameters: bodyParameters, bodyEncoding: bodyEncoding, urlParameters: urlParameters, request: &request)
            case .requestParametersAndHeaders(let bodyParameters, let bodyEncoding, let urlParameters, let additionalHeaders):
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters, bodyEncoding: bodyEncoding, urlParameters: urlParameters, request: &request)
            }
            
            return request
        } catch {
            throw error
        }
    }
    
    private func configureParameters(bodyParameters: Parameters?, bodyEncoding: ParameterEncoding, urlParameters: Parameters?, request: inout URLRequest) throws {
        do {
            try bodyEncoding.encode(urlRequest: &request, bodyParameters: bodyParameters, urlParameters: urlParameters)
        } catch {
            throw error
        }
    }
    
    private func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    private func handleNetworkResponse(_ response: URLResponse?) -> EmptyResult {
        guard let response = response as? HTTPURLResponse else {
            return .failure(NetworkErrorResponse.failed)
        }
        
        switch response.statusCode {
        case 200...203, 205, 206: return .success
        case 204, 444: return .failure(NetworkErrorResponse.noData)
        case 401...407: return .failure(NetworkErrorResponse.authentication)
        case 500...511: return .failure(NetworkErrorResponse.badRequest)
        default: return .failure(NetworkErrorResponse.failed)
        }
    }
    
}
