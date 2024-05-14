//
//  SliderCollectionViewCell.swift
//  ProductApp
//
//  Created by Berkay VURAL on 9.05.2024.
//

import UIKit

class VerticalProductsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
        
    func setupCell(product: Product) {
        lblTitle.text = product.title
        lblPrice.text = product.price.toRoundedTurkishLirasString()
        imgProduct.downloaded(from: product.image!)
    }
}
