//
//  NetworkService.swift
//  currencyConverter
//
//  Created by OnlyFrenzy on 18.12.2020.
//

import Foundation

class NetworkService {
    
    
    
    
    func request(link: Router, completion: @escaping (CurrencyJsonResponce?, Error?) -> Void) {
        guard let url = URL(string: link.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            
            if let error = error {
                print("Some error")
                completion(nil, error)
                return
            }
            guard let data = data else { return }
            do {
                let myCurrency = try JSONDecoder().decode(CurrencyJsonResponce.self, from: data)
                completion(myCurrency, nil)
            } catch let jsonError {
                print("Faled to decode JSON", jsonError)
                completion(nil, jsonError)
            }
            
        }.resume()
    }
    
}
