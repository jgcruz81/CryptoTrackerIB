//
//  APICaller.swift
//  CryptoTrackerIB
//
//  Created by Juan Cruz on 10/15/21.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private struct Constants {
        static let apiKey = "4B4A5839-85AC-414F-B09F-0F2B4B5F81A4"
        static let assetsEndpoint = "https://rest-sandbox.coinapi.io/v1/assets/"
    }
    
    private init() {}
    
    public func getAllCryptoData (
        //completion handler
        completion: @escaping (Result<[Crypto], Error>) -> Void
    ) {
        guard let url = URL(string: Constants.assetsEndpoint + "?apikey=" + Constants.apiKey) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                //decode response
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                
                completion(.success(cryptos))
            }
            catch{
                //completetion, hand back error
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
