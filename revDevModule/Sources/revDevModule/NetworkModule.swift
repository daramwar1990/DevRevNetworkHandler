//
//  NetworkModule.swift
//  
//
//  Created by Raghavendra Daramwar on 02/03/24.
//

import Foundation

public class NetworkManager {
   
  // public static let shared = NetworkManager()
   
   // private init() {} // Private initialization to ensure singleton usage
   
   public static func fetch<T: Codable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for errors
            if let error = error {
                completion(.failure(error))
                return
            }
           
            // Check for valid data
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
           
            // Attempt to decode the data
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    public static func sayHello(){
        print("Have a good day!!!!!!!!")
    }
}
