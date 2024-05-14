//
//  ViewController.swift
//  ProductApp
//
//  Created by Berkay VURAL on 8.05.2024.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    private let viewModel = HomeViewModel()
    private var cancallables: Set<AnyCancellable> = []
    
    @IBOutlet weak var collectionViewSlider: UICollectionView!
    @IBOutlet weak var collectionViewSliderHeight: NSLayoutConstraint!
    @IBOutlet weak var pageControlSlider: UIPageControl!
    
    @IBOutlet weak var collectionViewProducts: UICollectionView!
    
    
    
    var horizontalProducts : [Product] = []
    var verticalProducts : [Product] = []
    var counter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
        setupCollectionViews()
        DispatchQueue.main.async {
            self.showSpinner()
        }
        viewModel.getHorizontalProducts()
        viewModel.getAllProducts()
    }
    
    private func setupCollectionViews(){
        collectionViewSlider.dataSource = self
        collectionViewSlider.delegate = self
        collectionViewProducts.dataSource = self
        collectionViewProducts.delegate = self
        let widthSlider = (view.frame.width)
        let layoutSlider = collectionViewSlider.collectionViewLayout as! UICollectionViewFlowLayout
        layoutSlider.itemSize = CGSize(width: widthSlider, height: 120)
        let widthVertical = (view.frame.width / 2) - 15
        let layoutVertical = collectionViewProducts.collectionViewLayout as! UICollectionViewFlowLayout
        layoutVertical.itemSize = CGSize(width: widthVertical, height: 260)
    }
    
    func goDetailPage(product : Product?){
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            print("This means you haven't set your view controller identifier properly.")
            return
        }
        viewController.product = product
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func setupBinders(){
        viewModel.$getHorizontalProductsResponse.sink { response in
            DispatchQueue.main.async {
                self.removeSpinner()
            }
            if(response != nil){
                if response!.success {
                    self.horizontalProducts = response!.data!
                }else{
                    self.horizontalProducts = []
                    self.showErrorDialog(messageString: (response?.message) ?? "")
                }
                self.setHorizontalProducts()
            }
        }.store(in: &cancallables)
        viewModel.$getAllProductsResponse.sink { response in
            DispatchQueue.main.async {
                self.removeSpinner()
            }
            if(response != nil){
                if response!.success {
                    self.verticalProducts = response!.data!
                }else{
                    self.verticalProducts = []
                    self.showErrorDialog(messageString: (response?.message) ?? "")
                }
                self.setVerticalProducts()
            }
        }.store(in: &cancallables)
        viewModel.$getProductDetailResponse.sink { response in
            DispatchQueue.main.async {
                self.removeSpinner()
            }
            if(response != nil){
                if response!.success {
                    self.goDetailPage(product: response!.data!)
                }else{
                    self.showErrorDialog(messageString: (response?.message) ?? "")
                }
            }
        }.store(in: &cancallables)
    }
    
    func setHorizontalProducts(){
        if horizontalProducts.count == 0 {
            self.pageControlSlider.isHidden = true
            self.collectionViewSliderHeight.constant = 0
        }else{
            self.collectionViewSlider.reloadData()
            self.pageControlSlider.currentPage = 0
        }
    }
    
    func setVerticalProducts(){
        self.collectionViewProducts.reloadData()
    }
    
    func getProductDetails(productId : Int){
        DispatchQueue.main.async {
            self.showSpinner()
        }
        viewModel.getProductDetails(productId: productId)
    }

}

extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewSlider {
            return horizontalProducts.count
        }else{
            return verticalProducts.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewSlider {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalProductCollectionViewCell", for: indexPath) as! HorizontalProductCollectionViewCell
            cell.setupCell(product: horizontalProducts[indexPath.row])
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VerticalProductsCollectionViewCell", for: indexPath) as! VerticalProductsCollectionViewCell
            cell.setupCell(product: verticalProducts[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var product : Product?
        if collectionView == collectionViewSlider {
            product = horizontalProducts[indexPath.row]
        }else{
            product = verticalProducts[indexPath.row]
        }
        self.getProductDetails(productId: product!.id)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let cc = Int(scrollView.contentOffset.x) / Int(collectionViewSlider.frame.width)
        counter = cc + 1
        pageControlSlider?.currentPage = cc
    }
}

