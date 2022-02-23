//
//  BitCoinController.swift
//  Preco BitCoin
//
//  Created by Bruno Vieira Souza on 17/02/22.
//

import UIKit

class BitCoinController {
    
    var priceBitCoin: Welcome?
    
    func loadPriceBitCoin () {
        API.bitCoinRetorno { tickerBitCoin in
            self.priceBitCoin = tickerBitCoin
        }
    }
}
