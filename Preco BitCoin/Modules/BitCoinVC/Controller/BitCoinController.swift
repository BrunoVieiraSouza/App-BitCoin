//
//  BitCoinController.swift
//  Preco BitCoin
//
//  Created by Bruno Vieira Souza on 17/02/22.
//

import UIKit

class BitCoinController {
    
    private var priceBitCoin: Welcome?
    
    func loadPriceBitCoin() {
        API.bitCoinRetorno { tickerJson in
            self.priceBitCoin = tickerJson
            self.showPrice()
        }
    }
    
    func showPrice(){
        guard let price = priceBitCoin?.ticker.buy else {return}
    }
}
