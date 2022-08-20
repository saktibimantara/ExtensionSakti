//
//  UILabelTest.swift
//  ExtensionSaktiTests
//
//  Created by Ragil Bimantara on 13/08/22.
//

import XCTest
@testable import ExtensionSakti

class UILabelTest: XCTestCase {
    
    var subject: UILabel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        subject = UILabel()
        subject.text = "This is my test"
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDropShadow() {
        subject.textDropShadow()
        
        XCTAssertEqual(subject.layer.shadowRadius, 3.0)
        XCTAssertEqual(subject.layer.shadowOpacity, 1.0)
        XCTAssertEqual(subject.layer.shadowOffset, CGSize(width: 4, height: 4))
        
    }
    
    func testBold() {
        subject.bold()
        
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: subject.font.pointSize)]
        
        XCTAssertEqual(subject.font, UIFont.boldSystemFont(ofSize: subject.font.pointSize))
        
        let expected = NSMutableAttributedString(string: subject.text ?? "", attributes: attrs)
        XCTAssertEqual(subject.attributedText, expected)
        
        subject.text = nil
        subject.bold()
        
        let expectedNil = NSMutableAttributedString(string: subject.text ?? "", attributes: attrs)
        XCTAssertEqual(subject.attributedText, expectedNil)
    }
    
    func testNormal() {
        subject.normal()
        
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: subject.font.pointSize)]
        
        XCTAssertEqual(subject.font, UIFont.systemFont(ofSize: subject.font.pointSize))
        
        let expected = NSMutableAttributedString(string: subject.text ?? "", attributes: attrs)
        XCTAssertEqual(subject.attributedText, expected)
        
        subject.text = nil
        subject.normal()
        
        let expectedNil = NSMutableAttributedString(string: subject.text ?? "", attributes: attrs)
        XCTAssertEqual(subject.attributedText, expectedNil)
    }
    
    func testItalic() {
        subject.italic()
        
        
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.italicSystemFont(ofSize: subject.font.pointSize)]
        
        XCTAssertEqual(subject.font, UIFont.italicSystemFont(ofSize: subject.font.pointSize))
        
        let expected = NSMutableAttributedString(string: subject.text ?? "", attributes: attrs)
        XCTAssertEqual(subject.attributedText, expected)
        
        subject.text = nil
        subject.italic()
        
        let expectedNil = NSMutableAttributedString(string: subject.text ?? "", attributes: attrs)
        XCTAssertEqual(subject.attributedText, expectedNil)
        
    }
    
    func testColor() {
        let testColor = UIColor.green
        let textToColor = "test"
        let textString = subject.text
        
        guard let textString = textString else {
            fatalError("subject has no text")
        }

        subject.setColor(for: textToColor, color: testColor)
        
        
        let attributedString = NSMutableAttributedString(string: textString)
        let x = textString as NSString

        let attrs: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: testColor]

        attributedString.addAttributes(attrs, range: x.range(of: textToColor))
        
        XCTAssertEqual(subject.attributedText, attributedString)
    }
    
    func testUnderline() {
        let textToUnderline = "test"
        let textString = subject.text
        let testColor : UIColor? = UIColor.green
        


        subject.underline(text: textToUnderline, color: testColor)
        
        
        if let textString = subject.attributedText {
            let attributedString = NSMutableAttributedString(attributedString: textString)
            let x = textString.string as NSString

            var attrs: [NSAttributedString.Key: Any] = [.underlineStyle: NSUnderlineStyle.single.rawValue]

            if testColor != nil {
                attrs[.foregroundColor] = testColor
            }

            attributedString.addAttributes(attrs, range: x.range(of: textToUnderline))
            XCTAssertEqual(subject.attributedText, attributedString)
        }
    }
    
    func testStrikethrough() {
        var textToStrikethrough: String? = "test"
        let testColor : UIColor? = UIColor.green

        if let textString = subject.attributedText {
            var attributedString = NSMutableAttributedString(attributedString: textString)
            let x = textString.string as NSString

            var attrs: [NSAttributedString.Key: Any] = [.strikethroughStyle: 2]

            if testColor != nil {
                attrs[.foregroundColor] = testColor
            }

            if let t = textToStrikethrough {
                attributedString.addAttributes(attrs, range: x.range(of: t))
            } else {
                attributedString = NSMutableAttributedString(string: subject.text!, attributes: attrs)
            }
            
            subject.strikethrough(textToStrikethrough, color: testColor)
            
            
            XCTAssertEqual(subject.attributedText, attributedString)
        }
        
        textToStrikethrough = nil
        
        if let textString = subject.attributedText {
            var attributedString = NSMutableAttributedString(attributedString: textString)
            let x = textString.string as NSString

            var attrs: [NSAttributedString.Key: Any] = [.strikethroughStyle: 2]

            if testColor != nil {
                attrs[.foregroundColor] = testColor
            }

            if let t = textToStrikethrough {
                attributedString.addAttributes(attrs, range: x.range(of: t))
            } else {
                attributedString = NSMutableAttributedString(string: subject.text!, attributes: attrs)
            }
            
            subject.strikethrough(color: testColor)
            
            
            XCTAssertEqual(subject.attributedText, attributedString)
        }
    }
    
    func testBoldSpesificText() {
        
        let textToBold: String? = "test"
        let testColor : UIColor? = UIColor.green
        
        if let textString = subject.attributedText {
            let attributedString = NSMutableAttributedString(attributedString: textString)
            let x = textString.string as NSString

            var attrs: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: subject.font.pointSize)]

            if testColor != nil {
                attrs[.foregroundColor] = testColor
            }
            
            subject.bold(text: textToBold!, color: testColor)

            attributedString.addAttributes(attrs, range: x.range(of: textToBold!))
            XCTAssertEqual(subject.attributedText, attributedString)
        }
    }
    
    func testResizeToPattern() {
        let textToResize: String? = "test"
        let testSize : CGFloat? = 20
        
        if let textString = subject.attributedText {
            let attributedString = NSMutableAttributedString(attributedString: textString)
            let x = textString.string as NSString

            let attrs: [NSAttributedString.Key: Any] = [.font: UIFont(name: subject.font.familyName, size: testSize!)!]
            
            subject.resizePattern(text: textToResize!, size: testSize!)

            attributedString.addAttributes(attrs, range: x.range(of: textToResize!))
            XCTAssertEqual(subject.attributedText, attributedString)
        }
    }
    
    func testStartBlink() {
        subject.startBlink()
    }
    
    func testStopBlink() {
        subject.stopBlink()
    }


}
