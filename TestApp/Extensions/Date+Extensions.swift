//
//  Date+Extension.swift
//  TestApp
//
//  Created by cj on 16.02.2025.
//

import Foundation

extension Date {
    var formatDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
}
