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
    
    
    var controller: BitCoinController! = BitCoinController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPrice()
    }
    
    //MARK: - IBACTIONS
    @IBAction func atualizarPreco(_ sender: UIButton) {
        loadPrice()
    }
    
    func loadPrice() {
        controller.loadPriceBitCoin()
        guard let price = controller.priceBitCoin?.ticker.buy else {return}
        guard let value = Float(price) else {return}
        label.text = "R$ \(value)"
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

