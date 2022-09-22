//
//  UILabel.swift
//  ExtensionSakti
//
//  Created by Ragil Bimantara on 13/08/22.
//

import Foundation
import UIKit

@objc
public extension UILabel {
    func textDropShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.masksToBounds = false
    }

    func bold() {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: self.font.pointSize)]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: attrs)
    }

    func normal() {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: self.font.pointSize)]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: attrs)
    }

    func italic() {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.italicSystemFont(ofSize: self.font.pointSize)]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: attrs)
    }

    func setColor(for text: String, color: UIColor) {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            let x = textString as NSString

            let attrs: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: color]

            attributedString.addAttributes(attrs, range: x.range(of: text))
            self.attributedText = attributedString
        }
    }

    func underline(text: String, color: UIColor? = nil) {
        if let textString = self.attributedText {
            let attributedString = NSMutableAttributedString(attributedString: textString)
            let x = textString.string as NSString

            var attrs: [NSAttributedString.Key: Any] = [.underlineStyle: NSUnderlineStyle.single.rawValue]

            if color != nil {
                attrs[.foregroundColor] = color
            }

            attributedString.addAttributes(attrs, range: x.range(of: text))
            self.attributedText = attributedString
        }
    }

    func strikethrough(_ text: String? = nil, color: UIColor? = nil) {
        if let textString = self.attributedText {
            var attributedString = NSMutableAttributedString(attributedString: textString)
            let x = textString.string as NSString

            var attrs: [NSAttributedString.Key: Any] = [.strikethroughStyle: 2]

            if color != nil {
                attrs[.foregroundColor] = color
            }

            if let t = text {
                attributedString.addAttributes(attrs, range: x.range(of: t))
            } else {
                attributedString = NSMutableAttributedString(string: self.text!, attributes: attrs)
            }
            self.attributedText = attributedString
        }
    }

    func bold(text: String, color: UIColor? = nil) {
        if let textString = self.attributedText {
            let attributedString = NSMutableAttributedString(attributedString: textString)
            let x = textString.string as NSString

            var attrs: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: font.pointSize)]

            if color != nil {
                attrs[.foregroundColor] = color
            }

            attributedString.addAttributes(attrs, range: x.range(of: text))
            self.attributedText = attributedString
        }
    }

    func resizePattern(text: String, size: CGFloat) {
        if let textString = self.attributedText {
            let attributedString = NSMutableAttributedString(attributedString: textString)
            let x = textString.string as NSString

            let attrs: [NSAttributedString.Key: Any] = [.font: UIFont(name: self.font.familyName, size: size)!]

            attributedString.addAttributes(attrs, range: x.range(of: text))
            self.attributedText = attributedString
        }
    }

    func startBlink() {
        UIView.animate(withDuration: 0.8,
                       delay: 0.0,
                       options: [.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
                       animations: { self.alpha = 0 },
                       completion: nil)
    }

    func stopBlink() {
        layer.removeAllAnimations()
        self.alpha = 1
    }

}
