//
//  CepViewModel.swift
//  Login
//
//  Created by Allan Amaral on 27/07/22.
//

import Foundation

struct CepViewModel {
    private let model: CepModel
    
    init(with model: CepModel) {
        self.model = model
    }
    
    var state: String {
        model.state ?? String.empty
    }
    
    var city: String {
        model.city ?? String.empty
    }
    
    var neighbourhood: String {
        model.neighbourhood ?? String.empty
    }
    
    var street: String {
        guard let place = model.place, let placeType = model.placeType else { return String.empty }
        return "\(placeType) \(place)"
    }
    
    var isCepValid: Bool {
        return model.result ?? "0" == "1" ? true : false
    }
    
    static func get(cep: String, completion: @escaping((CepViewModel?, Error?) -> Void)) {
        let provider = CepProvider()
        
        provider.getAddress(from: cep) { (model, error) in
            if let cepModel = model {
                completion(CepViewModel(with: cepModel), nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
