//
//  NetworkManager.swift
//  Tunley
//
//  Created by Angel Zambrano on 2/28/23.
//

import Foundation
import UIKit
import StoreKit


enum StoreItemError: Error, LocalizedError {
    case itemsNotFound
    case imageDataMissing
}

struct NetworkManager
{
    
    static func fetchImage(from url: URL) async throws -> UIImage {
         var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
         urlComponents?.scheme = "https"
         
         let (data, response) = try await URLSession.shared.data(from: urlComponents!.url!)
     
         guard let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 else {
             throw StoreItemError.imageDataMissing
         }
     
         guard let image = UIImage(data: data) else {
             throw StoreItemError.imageDataMissing
         }
         return image
     } 
    
}


