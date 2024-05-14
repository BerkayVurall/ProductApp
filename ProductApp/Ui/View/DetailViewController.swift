//
//  DetailViewController.swift
//  ProductApp
//
//  Created by Berkay VURAL on 9.05.2024.
//

import UIKit

class DetailViewController : UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var viewStar: UIView!
    
    var product : Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if product == nil {
            
        }else{
            setImageView()
            setStarView()
            setTitle()
            setDescription()
            setPrice()
        }
    }
    
    func setStarView(){
        let starRatingView = StarRatingView(frame: CGRect(origin: .zero, size: CGSize(width: 250, height: 50)), rating: Float(product?.rating?.rate ?? 0), color: UIColor.systemOrange, starRounding: .roundToHalfStar)
        starRatingView.frame = viewStar.frame
        view.addSubview(starRatingView)
    }
    
    func setImageView(){
        imgProduct.downloaded(from: product!.image!)
    }
    
    func setTitle(){
        lblTitle.text = product!.title
    }
    
    func setDescription(){
        lblDescription.text = product!.description
    }
    
    func setPrice(){
        lblPrice.text = product!.price.toRoundedTurkishLirasString()
    }

}
