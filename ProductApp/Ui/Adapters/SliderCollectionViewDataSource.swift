//
//  SliderCollectionViewDataSource.swift
//  ProductApp
//
//  Created by Berkay VURAL on 9.05.2024.
//

import Foundation
import UIKit

class SliderCollectionViewDataSource : CollectionViewDataSource {
    private var products : [Product] = []
    
    init(products: [Product]) {
        self.products = products
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCollectionViewCell
        cell.lblTitle.text = products[indexPath.row].title
        cell.lblPrice.text = String(products[indexPath.row].price)
        return cell
        
    }
}
