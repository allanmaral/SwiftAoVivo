//
//  CepModel.swift
//  Login
//
//  Created by Allan Amaral on 27/07/22.
//

struct CepModel: Codable {
    let state: String?
    let city: String?
    let neighbourhood: String?
    let placeType: String?
    let place: String?
    let result: String?
    let resultTxt: String?

    enum CodingKeys: String, CodingKey {
        case state = "uf"
        case city = "cidade"
        case neighbourhood = "bairro"
        case placeType = "tipo_logradouro"
        case place = "logradouro"
        case result = "resultado"
        case resultTxt = "resultado_txt"
    }
}
