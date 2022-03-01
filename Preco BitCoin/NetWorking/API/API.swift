//
//  API.swift
//  Preco BitCoin
//
//  Created by Bruno Vieira Souza on 06/12/21.
//

import Foundation

protocol APIReturnDelegate: AnyObject {
    func returnDados(dados: Welcome)
}

class API {
    
    weak var delegate: APIReturnDelegate?
    
    init() {
        bitCoinRetorno()
    }
    
    func bitCoinRetorno() {
        if let url = URL(string: "https://www.mercadobitcoin.net/api/BTC/ticker") {
            let tarefa = URLSession.shared.dataTask(with: url) { data, response, error in
                if error == nil {
                    if let dados = data {
                        do {
                            let dadosJson = try JSONDecoder().decode(Welcome.self, from: dados)
                            self.delegate?.returnDados(dados: dadosJson)
                        } catch {
                            print("erro ao decodificar json")
                        }
                    }
                } else {
                    print ("Erro ao fazer a consulta")
                }
            }
            tarefa.resume()
        }
    }
}
