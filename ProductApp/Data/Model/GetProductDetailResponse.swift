//
//  GetProductDetailResponse.swift
//  ProductApp
//
//  Created by Berkay VURAL on 8.05.2024.
//

import Foundation
import UIKit

struct GetProductDetailResponse : BaseResponse {
    var success: Bool
    var message: String?
    var data : Product?
}
