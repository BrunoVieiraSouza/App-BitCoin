
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
