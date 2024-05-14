//
//  NetworkService.swift
//  ProductApp
//
//  Created by Berkay VURAL on 8.05.2024.
//

import Foundation
import Alamofire
final class NetworkService {
    let requestFactory = RequestFactory()
    
    func GetProducts(limit : Int, completion : @escaping(GetProductsResponse)-> Void){
        if let req = requestFactory.request(of: .getProducts(limit: limit)){
            AF.request(req).responseDecodable(of: [Product]?.self, completionHandler: { response in
                switch response.result{
                    case .success(_):
                        completion(GetProductsResponse(success: true,message: "Başarılı.",data: response.value as? [Product]))
                    case .failure(let err):
                    if err.isSessionTaskError{ //servise ulaşılamıyor internet olmayabilir
                        if Reachability().connectionStatus() == .Offline {
                            completion(GetProductsResponse(success: false,message: "İnternet bağlantınız yok.",data: nil))
                        }else{
                            completion(GetProductsResponse(success: false,message: "Servise erişilemiyor.",data: nil))
                        }
                    }
                    else{
                        completion(GetProductsResponse(success: false,message: "Beklenmeyen bir hatayla karşılaşıldı. Lütfen daha sonra tekrar deneyin.",data: nil))
                    }
                }
            })
        }
        else{
            completion(GetProductsResponse(success: false,message: "Beklenmeyen bir hatayla karşılaşıldı.",data: nil))
        }
    }
    
    
    func GetProductDetails(productId : Int, completion : @escaping(GetProductDetailResponse)-> Void){
        if let req = requestFactory.request(of: .getProductDetail(id: productId)){
            AF.request(req).responseDecodable(of: Product.self, completionHandler: { response in
                switch response.result{
                    case .success(_):
                        completion(GetProductDetailResponse(success: true,message: "Başarılı.",data: response.value))
                    case .failure(let err):
                        if err.isSessionTaskError{ //servise ulaşılamıyor internet olmayabilir
                            if Reachability().connectionStatus() == .Offline {
                                completion(GetProductDetailResponse(success: false,message: "İnternet bağlantınız yok.",data: nil))
                            }else{
                                completion(GetProductDetailResponse(success: false,message: "Servise erişilemiyor.",data: nil))
                            }
                        }
                        else{
                            completion(GetProductDetailResponse(success: false,message: "Beklenmeyen bir hatayla karşılaşıldı. Lütfen daha sonra tekrar deneyin.",data: nil))
                        }
                }
            })
        }
        else{
            completion(GetProductDetailResponse(success: false,message: "Beklenmeyen bir hatayla karşılaşıldı.",data: nil))
        }
    }
    
}

