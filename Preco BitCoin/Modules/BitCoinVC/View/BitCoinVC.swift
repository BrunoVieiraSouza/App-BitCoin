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
    
    var controller: BitCoinController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller = BitCoinController()
        controller?.delegate = self
    }
    
    //MARK: - IBACTIONS
    @IBAction func atualizarPreco(_ sender: UIButton) {
        
    }
}

extension BitCoinVC: BitCoinControllerDelegate {
    
    func showPrice(price: String) {
        DispatchQueue.main.async {
            self.label.text = price
        }
    }
}
