//
//  ProductRepository.swift
//  ProductApp
//
//  Created by Berkay VURAL on 10.05.2024.
//

import Foundation
class ProductRepository {
    private let networkService = NetworkService()
    
    func GetProducts(limit : Int, completion : @escaping(GetProductsResponse)-> Void){
        networkService.GetProducts(limit: limit){ resp in
            completion(resp)
        }
    }
    
    
    func GetProductDetails(productId : Int, completion : @escaping(GetProductDetailResponse)-> Void){
        networkService.GetProductDetails(productId: productId){ resp in
            completion(resp)
        }
    }
}
