//
//  API.swift
//  Tunley
//
//  Created by Angel Zambrano on 3/7/23.
//

import Foundation

class API {
    
    let shared = API()
    
    static func gettingSongs(completion: @escaping (Result<TracksResponse, Error>) -> Void) {
        guard var url  = URLComponents(string: "https://itunes.apple.com/search?term=blackpink&attribute=artistTerm&entity=song&media=music") else {return}
        
        
        var request = URLRequest(url: url.url!)
          
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
              if let error = error {
                  completion(.failure(error))
              } else if let data = data {
                  do {
                      let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                      
                      print(responseJSON)
                      
                      let decoder = JSONDecoder()
                      // Create a date formatter
                      let dateFormatter = DateFormatter()

                      // Set a custom date format based on what we see coming back in the JSON
                      dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

                      // Set the decoding strategy on the JSON decoder to use our custom date format
                      decoder.dateDecodingStrategy = .formatted(dateFormatter)
                      
                      
                      let searchResponse = try decoder.decode(TracksResponse.self, from: data) // gets the artists
                      

                      completion(.success(searchResponse))
                  } catch {
                      completion(.failure(error))
                  }
              }
          }

          task.resume()
          }
    
}
