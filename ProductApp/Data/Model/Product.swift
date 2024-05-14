//
//  Product.swift
//  ProductApp
//
//  Created by Berkay VURAL on 8.05.2024.
//

import Foundation

struct Product : Codable {
    var id : Int
    var title : String
    var price : Double
    var description : String
    var category : String?
    var image : String?
    var rating : Rating?
}

struct Rating : Codable {
    var rate : Double?
    var count : Int?
}
