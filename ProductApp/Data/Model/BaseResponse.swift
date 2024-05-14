//
//  BaseResponse.swift
//  ProductApp
//
//  Created by Berkay VURAL on 9.05.2024.
//

import Foundation
protocol BaseResponse : Codable {
    var success : Bool { get set }
    var message : String? { get set }
}
