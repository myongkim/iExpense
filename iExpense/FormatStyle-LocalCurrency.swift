//
//  FormatStyle-LocalCurrency.swift
//  iExpense
//
//  Created by Isaac Kim on 4/14/22.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currencyCode ?? "USD")
    }
}
