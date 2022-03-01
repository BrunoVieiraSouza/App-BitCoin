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

class BitCoinController {
    
    init() {
        loadPriceBitCoin()
    }
    
    weak var delegate: BitCoinControllerDelegate?
    private var priceBitCoin: Welcome?
    
    private func loadPriceBitCoin() {
        API.bitCoinRetorno { tickerBitCoin in
            self.priceBitCoin = tickerBitCoin
            self.priceBit()
        }
    }
    
    private func priceBit() {
        guard let priceBitCoin = priceBitCoin?.ticker.buy else { return }
        delegate?.showPrice(price: priceBitCoin)
    }
}


