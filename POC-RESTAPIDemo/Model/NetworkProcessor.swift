//
//  NetworkProcessor.swift
//  POC-RESTAPIDemo
//
//  Created by Andres Sosa on 12/11/18.
//  Copyright © 2018 Andres Sosa. All rights reserved.
//

import Foundation

class NetworkProcessor {
    // START CLASS PROPERTIES
    lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session: URLSession = URLSession(configuration: self.configuration)
    // END   CLASS PROPERTIES
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    typealias JSONDictionaryHandler = (([String: Any]?) -> Void)
    
    func downloadJSONFromURL(_ completion: @escaping JSONDictionaryHandler) {
        let request = URLRequest(url: self.url)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                        case 200:
                            // successfull response
                            if let data = data {
                                do {
                                    let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                                    
                                    completion(jsonDictionary as? [String: Any])
                                    
                                } catch let error as NSError {
                                    print ("Error Processing Json Data: \(error.localizedDescription)")
                                }
                        }
                    default:
                        print("HTTP Response Code: \(httpResponse.statusCode)")
                    }
                }
            } else {
                print ("Error: \(String(describing: error?.localizedDescription))")
            }
        }
        
        dataTask.resume()
    }
}
