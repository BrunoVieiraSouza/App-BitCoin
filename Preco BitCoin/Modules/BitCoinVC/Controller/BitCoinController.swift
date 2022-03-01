//
//  BitCoinController.swift
//  Preco BitCoin
//
//  Created by Bruno Vieira Souza on 17/02/22.
//

import UIKit

protocol BitCoinControllerDelegate: AnyObject {
    func showPrice (price: String)
}

final class BitCoinController {
    
    init() {
        loadPriceBitCoin()
    }
    
    var api: API?
    weak var delegate: BitCoinControllerDelegate?
    private var priceBitCoin: Welcome?
    
    private func loadPriceBitCoin() {
        api = API()
        api?.delegate = self
    }
    
    private func priceBit() {
        guard let priceBitCoin = priceBitCoin?.ticker.buy else { return }
        delegate?.showPrice(price: priceBitCoin)
    }
}

extension BitCoinController: APIReturnDelegate {
    func returnDados(dados: Welcome) {
        priceBitCoin = dados
        priceBit()
    }
}
