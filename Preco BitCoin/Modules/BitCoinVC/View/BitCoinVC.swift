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
    
    //MARK: - VARIAVEL PARA SALVAR O PRECO DO BITCOIN
    var bitCoin: Welcome!
    
    //MARK: CICLO DE VIDA
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPrice()
    }
    
    //MARK: - IBACTIONS
    @IBAction func atualizarPreco(_ sender: UIButton) {
        loadPrice()
    }
    
    //MARK: - METODOS PARA CARREGAR E CONFIGURAR INFORMACOES TRAZIDAS PELA API
    func loadPrice() {
        self.bttAtualizar.setTitle("Atualizando...", for: .normal)
        bttAtualizar.alpha = 0.1
        API.bitCoinRetrono { tickerJson in
            self.bitCoin = tickerJson
            DispatchQueue.main.async {
                let numero = Float(self.bitCoin.ticker.buy)!
                let formatado = self.formatterPrice(preco: NSNumber(value: numero))
                self.label.text = "R$ " + formatado
                self.bttAtualizar.setTitle("Atualizar", for: .normal)
                self.bttAtualizar.alpha = 1
            }
        }
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

