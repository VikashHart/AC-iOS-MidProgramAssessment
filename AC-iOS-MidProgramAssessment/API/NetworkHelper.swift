//
//  NetworkHelper.swift
//  AC-iOS-MidProgramAssessment
//
//  Created by C4Q on 12/8/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct NetworkHelper {
    private init() {}
    static let manager = NetworkHelper()
    private let session = URLSession(configuration: .default)
    func performDataTask(with request: URLRequest,
                         completionHandler: @escaping (Data) -> Void,
                         errorHandler: @escaping (AppError) -> Void) {
        session.dataTask(with: request){(data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {errorHandler(AppError.badData); return}
                if let error = error {
                    errorHandler(AppError.other(rawError: error))
                }
                completionHandler(data)
            }
            }.resume()
    }
}

