//
//  UIButton.swift
//  ExtensionSakti
//
//  Created by Ragil Bimantara on 22/09/22.
//

import Foundation
import UIKit

@IBDesignable
public extension UIButton {

    @IBInspectable
    var borderWidth: CGFloat {
        
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
        
    }

    @IBInspectable var cornerRadius: CGFloat {
        
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
        
    }

    @IBInspectable var borderColor: UIColor? {
        
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            guard let uiColor = newValue else { return }
            
            layer.borderColor = uiColor.cgColor
        }
    }

 func setColouredImage(image: UIImage?, tintColor: UIColor?, state: UIControl.State = .normal) {
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        self.setImage(tintedImage, for: state)
        self.tintColor = tintColor
        self.setTitle("", for: .normal)
    }

    func setColouredImage(name: String, tintColor: UIColor?, state: UIControl.State = .normal) {
        setColouredImage(image: UIImage(named: name), tintColor: tintColor, state: state)
    }
}
