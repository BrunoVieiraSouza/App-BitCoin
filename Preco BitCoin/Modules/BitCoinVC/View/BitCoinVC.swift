//
//  ViewController.swift
//  Preco BitCoin
//
//  Created by Bruno Vieira Souza on 06/12/21.
//

import UIKit

class BitCoinVC: UIViewController {
    
    
    //MARK: - OUTLETS
    @IBOutlet weak var bttAtualizar: UIButton!
    @IBOutlet weak var label: UILabel!
    
    
    let controller: BitCoinController = BitCoinController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.loadPriceBitCoin() 
    }
    
    //MARK: - IBACTIONS
    @IBAction func atualizarPreco(_ sender: UIButton) {
        
    }
    
    //MARK:
    func showPriceBit(price: String) {
        label.text = price
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func formatterPrice(preco: NSNumber) -> String {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.locale = Locale(identifier: "pt_BR")
        
        if let precoFinal = nf.string(from: preco) {
            return precoFinal
        }
        return "0,00"
    }
}

