import Foundation
import UIKit

extension String {
    func currencyFormatter(price: Double)-> String{
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        return currencyFormatter.string(from: NSNumber(value: price))!
        
    }
}
