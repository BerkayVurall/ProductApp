//
//  RequestFactory.swift
//  ProductApp
//
//  Created by Berkay VURAL on 8.05.2024.
//

import Foundation
import Alamofire

final class RequestFactory {
 
  func request(of type: RequestType) -> URLRequestConvertible? {
      switch type {
      case .getProducts(let limit):
          do{
              return try URLRequest(url: Global.baseUrl + "products?limit=" + String(limit),method: .get)
          }catch(_){
              return nil
          }
      case .getProductDetail(let id):
          do{
              return try URLRequest(url: Global.baseUrl + "products/" + String(id),method: .get)
          }catch(_){
              return nil
          }
      }
  }
  
}

extension RequestFactory {
    enum RequestType {
        case getProducts(limit : Int)
        case getProductDetail(id: Int)
    }
}
