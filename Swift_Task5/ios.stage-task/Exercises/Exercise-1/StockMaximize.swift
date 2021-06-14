import Foundation

class StockMaximize {

    func getCount(prices: [Int]) -> Int {
        guard let lastPrice = prices.last else { return .zero }
        return prices.map{lastPrice - $0}.reduce(.zero, +)
    }
    
    func countProfit(prices: [Int]) -> Int {
        guard let firstPrice = prices.first, prices.count > 1 else { return .zero }
        var profit = Int.zero
        var somePrices = [Int]()
        somePrices.append(firstPrice)
        for index in 0...(prices.count - 2) {
            if prices[index] <= prices[index + 1] {
                somePrices.append(prices[index + 1])
            } else {
                if somePrices.count > 1 {
                    profit += getCount(prices: somePrices)
                }
                somePrices.removeAll()
                somePrices.append(prices[index + 1])
            }
        }
        if somePrices.count > 1 {
            profit += getCount(prices: somePrices)
        }
        return profit
    }
}
