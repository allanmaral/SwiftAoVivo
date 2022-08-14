//
//  CepProvider.swift
//  Login
//
//  Created by Allan Amaral on 27/07/22.
//

import Foundation

class CepProvider {
    func getAddress(from cep: String, completion: @escaping((CepModel?, Error?) -> Void)) {
        let urlString = "https://webservice.kinghost.net/web_cep.php?auth=73b65d791603439f96cab4e7af82e7d0&formato=json&cep=\(cep.replacingOccurrences(of: "-", with: ""))"
        
        guard let url = URL(string: urlString) else { return }
        let urlRequest = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest) { (data, response, error) in
            if let error = error {
                completion(nil, error)
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                
                guard let model = try? decoder.decode(CepModel.self, from: data) else {
                    completion(nil, error)
                    return
                }
                
                completion(model, nil)
            }
        }
        
        task.resume()
    }
}
