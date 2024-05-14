//
//  HomeViewModel.swift
//  ProductApp
//
//  Created by Berkay VURAL on 9.05.2024.
//

import Foundation
final class HomeViewModel{
    @Published var getHorizontalProductsResponse : GetProductsResponse?
    @Published var getAllProductsResponse : GetProductsResponse?
    @Published var getProductDetailResponse : GetProductDetailResponse?

    private let productRepository = ProductRepository()
    
    func getHorizontalProducts(){
        productRepository.GetProducts(limit: 5) { response in
            self.getHorizontalProductsResponse = response
        }
    }
    
    func getAllProducts(){
        productRepository.GetProducts(limit: 0) { response in
            self.getAllProductsResponse = response
        }
    }
    
    func getProductDetails(productId : Int){
        productRepository.GetProductDetails(productId: productId) { response in
            self.getProductDetailResponse = response
        }
    }
    
}
