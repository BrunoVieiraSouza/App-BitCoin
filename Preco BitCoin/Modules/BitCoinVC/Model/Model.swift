
import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let ticker: Ticker
}

// MARK: - Ticker
struct Ticker: Codable {
    let high, low, vol, last: String
    let buy, sell, tickerOpen: String
    let date: Int

    enum CodingKeys: String, CodingKey {
        case high, low, vol, last, buy, sell
        case tickerOpen = "open"
        case date
    }
}


//func formatterPrice(preco: NSNumber) -> String {
//    let nf = NumberFormatter()
//    nf.numberStyle = .decimal
//    nf.locale = Locale(identifier: "pt_BR")
//
//    if let precoFinal = nf.string(from: preco) {
//        return precoFinal
//    }
//    return "0,00"
//}
