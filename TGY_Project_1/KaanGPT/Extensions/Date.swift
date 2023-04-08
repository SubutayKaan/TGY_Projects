//
//  Date.swift
//  KaanGPT
//
//  Created by Subutay Kaan Sevim on 8.04.2023.
//

import Foundation

extension Date {
    func formatToDefault() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMM d, yyyy"
        
        return dateFormater.string(from: self)
        
    }
}
