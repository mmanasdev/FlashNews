//
//  Date+Utils.swift
//  FlashNews
//
//  Created by Miguel Mañas Alvarez on 25/2/25.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale.current
        return formatter.string(from: self)
    }
}

