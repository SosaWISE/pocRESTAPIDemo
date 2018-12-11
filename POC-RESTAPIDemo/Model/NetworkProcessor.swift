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
    
    func downloadJSONFromURL(_ competion: @escaping JSONDictionaryHandler) {
        let request = URLRequest(url: self.url)
        
    }
}
