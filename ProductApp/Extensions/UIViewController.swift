//
//  UIViewController.swift
//  ProductApp
//
//  Created by Berkay VURAL on 9.05.2024.
//

import Foundation
import UIKit
fileprivate var aView: UIView?

extension UIViewController{
    func showSpinner(){
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView(style:.large)
        ai.color = UIColor.init(named: "PrimaryColor")
        ai.center = aView!.center
        ai.startAnimating()
        aView?.addSubview(ai)
        self.view.addSubview(aView!)
    }
    
     func removeSpinner(){
         aView?.removeFromSuperview()
         aView = nil
     }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showErrorDialog(messageString : String){
        DispatchQueue.main.async {
            let message = CustomMessageDialog()
            message.bodyText = messageString
            message.success = false
            message.titleText = "Hata!"
            message.buttonText = "Tamam"
            message.show()
        }
    }
}
