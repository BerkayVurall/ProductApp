//
//  UIView.swift
//  Chipster
//
//  Created by Berkay VURAL on 28.04.2024.
//

import Foundation
import UIKit
extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }

}
