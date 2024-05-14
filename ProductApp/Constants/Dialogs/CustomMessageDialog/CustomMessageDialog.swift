//
//  CustomMessageDialog.swift
//  Chipster
//
//  Created by Berkay VURAL on 2.05.2024.
//

import Foundation
import UIKit
class CustomMessageDialog: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    
    @IBOutlet weak var btnTamam: UIButton!
    
    
    
    var success = Bool()
    var buttonText = String()
    var bodyText = String()
    var titleText = String()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if success {
            imageView.image = UIImage(named: "messageSuccess")
            lblTitle.textColor = UIColor(red: 0.267, green: 0.74, blue: 0.196, alpha: 1)
        }else{
            imageView.image = UIImage(named: "messageError")
            lblTitle.textColor = UIColor(red: 0.82, green: 0, blue: 0, alpha: 1)
        }
        lblTitle.text = titleText
        lblBody.text = bodyText
        btnTamam.setTitle(buttonText, for: UIControl.State.normal)
        btnTamam.addTarget(self, action: #selector(closeDialog), for: .primaryActionTriggered)
        
        
    }
    @objc func closeDialog(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    init() {
        super.init(nibName: "CustomMessageDialog", bundle: Bundle(for: CustomMessageDialog.self))
        self.modalPresentationStyle = .formSheet
        self.modalTransitionStyle = .coverVertical
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show() {
        if #available(iOS 13, *) {
            UIApplication.shared.windows.first?.rootViewController?.present(self, animated: true, completion: nil)
        } else {
            UIApplication.shared.keyWindow?.rootViewController!.present(self, animated: true, completion: nil)
        }
    }
    
    
}
