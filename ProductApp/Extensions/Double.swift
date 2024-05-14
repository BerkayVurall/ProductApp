//
//  Double.swift
//  ProductApp
//
//  Created by Berkay VURAL on 9.05.2024.
//

import Foundation
extension Double {
    func toRoundedTurkishLirasString() -> String{
        return String(format: "%.2f", self) + " TL"
    }
}
