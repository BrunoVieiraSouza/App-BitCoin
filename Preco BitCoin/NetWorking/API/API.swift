//
//  API.swift
//  Preco BitCoin
//
//  Created by Bruno Vieira Souza on 06/12/21.
//

import Foundation

class API {
    
    static func bitCoinRetorno (_ onCompletion: @escaping (Welcome) -> Void) {
        if let url = URL(string: "https://www.mercadobitcoin.net/api/BTC/ticker") {
            let tarefa = URLSession.shared.dataTask(with: url) { data, response, error in
                if error == nil {
                    if let dados = data {
                        do {
                            let dadosJson = try JSONDecoder().decode(Welcome.self, from: dados)
                            onCompletion(dadosJson)
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
