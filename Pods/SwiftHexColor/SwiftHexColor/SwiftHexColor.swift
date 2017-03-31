/**
 * SwiftHexColor.swift
 *
 * Copyright (c) 2016 Aleksandr Nazarov
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */


import UIKit

public extension UIColor {
    
    public convenience init?(hex: Int) {
        self.init(hex: hex, alpha: 1.0)
    }
    
    public convenience init?(hex: Int, alpha: Float) {
        
        var hexString = String(format: "%2x", hex)
        let maxCharactersCount = 6
        
        if hexString.characters.count > maxCharactersCount {
            hexString = hexString.substring(to: hexString.index(hexString.startIndex, offsetBy: maxCharactersCount))
        }
        
        hexString = String(hexString.characters.filter({
            String($0).rangeOfCharacter(from: CharacterSet(charactersIn: "abcdefABCDEF0123456789")) != nil
        }))
        
        let additionalCharactersCount = maxCharactersCount - hexString.characters.count
        let additionalZeroString = String(repeating: "0", count: additionalCharactersCount)
        hexString = additionalZeroString + hexString
        
        self.init(hexString: hexString, alpha: alpha)
    }
    
    public convenience init?(hexString: String) {
        self.init(hexString: hexString, alpha: 1.0)
    }
    
    public convenience init?(hexString: String, alpha: Float) {
        
        var hexString = hexString
        if hexString.hasPrefix("#") {
            hexString = hexString.substring(from: hexString.index(hexString.startIndex, offsetBy: 1))
        }
        
        guard let _ = hexString.range(of: "(^[0-9A-Fa-f]{6}$)|(^[0-9A-Fa-f]{3}$)", options: .regularExpression, range: nil, locale: nil) else {return nil}
        
        if hexString.characters.count == 3 {
            let firstCharacterIndex = hexString.index(hexString.startIndex, offsetBy: 1)
            let lastCharacterIndex = hexString.index(hexString.endIndex, offsetBy: -1)
            
            let firstCharacter = hexString.substring(to: firstCharacterIndex)
            let secondCharacter = hexString.substring(from: firstCharacterIndex).substring(to: firstCharacterIndex)
            let thirdCharacter = hexString.substring(from: lastCharacterIndex)
            
            hexString = firstCharacter + firstCharacter + secondCharacter + secondCharacter + thirdCharacter + thirdCharacter
        }
        
        let firstCharactersPairIndex = hexString.index(hexString.startIndex, offsetBy: 2)
        let lastCharactersPairIndex = hexString.index(hexString.endIndex, offsetBy: -2)
        
        let redHexString = hexString.substring(to: firstCharactersPairIndex)
        let greenHexString = hexString.substring(from: firstCharactersPairIndex).substring(to: firstCharactersPairIndex)
        let blueHexString = hexString.substring(from: lastCharactersPairIndex)
        
        var redInt: UInt32 = 0
        var greenInt: UInt32 = 0
        var blueInt: UInt32 = 0
        
        Scanner(string: redHexString).scanHexInt32(&redInt)
        Scanner(string: greenHexString).scanHexInt32(&greenInt)
        Scanner(string: blueHexString).scanHexInt32(&blueInt)
        
        self.init(red: CGFloat(redInt) / 255.0, green: CGFloat(greenInt) / 255.0, blue: CGFloat(blueInt) / 255.0, alpha: CGFloat(alpha))
    }
}
