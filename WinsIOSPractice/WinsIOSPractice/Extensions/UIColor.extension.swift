//
//  UIColor.extension.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    var isDark:Bool
    {
        // algorithm from: http://www.w3.org/WAI/ER/WD-AERT/#color-contrast
        let components = self.cgColor.components ?? [ 0.0, 0.0, 0.0 ]
        let brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000
        
        if brightness > 0.5
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    func lighter(by percentage:CGFloat=30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage:CGFloat=30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage:CGFloat=30.0) -> UIColor? {
        var r:CGFloat=0, g:CGFloat=0, b:CGFloat=0, a:CGFloat=0;
        if(self.getRed(&r, green: &g, blue: &b, alpha: &a)){
            return UIColor(red: min(r + percentage/100, 1.0),
                           green: min(g + percentage/100, 1.0),
                           blue: min(b + percentage/100, 1.0),
                           alpha: a)
        }else{
            return nil
        }
    }
}

extension UIColor {

    convenience init(red: Int, green:Int, blue:Int, alpha:CGFloat = 1 ) {
        self.init(red:   CGFloat( red )   / 255,
                  green: CGFloat( green ) / 255,
                  blue:  CGFloat( blue )  / 255,
                  alpha: alpha )
    }

    convenience init(hex: String) {
        var value = hex.replacingOccurrences(of: "#", with: "")

        var alpha: CGFloat = 1.0
        var rgbValue: UInt32 = 0
        if hex.count > 7 && hex != "#NNNNNN00" {
            alpha = CGFloat(Float(hex.suffix(2)) ?? 100) / 100
            value = String(value.dropLast(2))
        }
        let scanner = Scanner(string: value)
        scanner.scanHexInt32(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16)/255,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8)/255,
                  blue: CGFloat(rgbValue & 0x0000FF)/255,
                  alpha: alpha)
    }

    var hexString: String {
        let colorRef = cgColor.components
        let r = colorRef?[0] ?? 0
        let g = colorRef?[1] ?? 0
        let b = ((colorRef?.count ?? 0) > 2 ? colorRef?[2] : g) ?? 0
        let a = cgColor.alpha

        var color = String(
            format: "#%02lX%02lX%02lX",
            lroundf(Float(r * 255)),
            lroundf(Float(g * 255)),
            lroundf(Float(b * 255))
        )

        if a != 1 {
            color += String(Int(a * 100))
        }

        return color
    }
    
    
    
    
    static var lightBackground: UIColor { return UIColor(red: 234 / 255.0, green: 234 / 255.0, blue: 234 / 255.0, alpha: 1) }
    static var lightBlue: UIColor { return UIColor(red: 0, green: 0.5, blue: 1, alpha: 1) }
    static var darkMenuFirst: UIColor { return UIColor(red: 40 / 255.0, green: 56 / 255.0, blue: 79 / 255.0, alpha: 1) }
    static var darkMenuSecond: UIColor { return UIColor(red: 34 / 255.0, green: 46 / 255.0, blue: 65 / 255.0, alpha: 1) }
    static var greenButton: UIColor { return UIColor(red: 0, green: 161 / 255.0, blue: 75 / 255.0, alpha: 1) }

    
    
    
    var lighterColor: UIColor {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        if self.getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: min(r + 0.2, 1.0), green: min(g + 0.2, 1.0), blue: min(b + 0.2, 1.0), alpha: a)
        }
        return self
    }
    
    var darkerColor: UIColor {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        if self.getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: max(r - 0.3, 0.0), green: max(g - 0.3, 0.0), blue: max(b - 0.3, 0.0), alpha: a)
        }
        return self
    }
    
    var textColor: UIColor {
        //TODO
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        if self.getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: (1 - r), green: (1 - g), blue: (1 - b), alpha: a)
        }
        return self
    }
    
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r, g, b, a)
    }
    
    var hsba: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return (h, s, b, a)
    }
    
    func adjust( saturation:CGFloat, brightness:CGFloat  ) -> UIColor {
        var hsba = self.hsba
        hsba.saturation += hsba.saturation * ( saturation / 100 )
        hsba.brightness += hsba.brightness * ( brightness / 100 )

        return UIColor( hsba )
    }
    
    convenience init(_ hsba: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)  ){
        self.init(hue: hsba.hue, saturation: hsba.saturation, brightness: hsba.brightness, alpha: hsba.alpha )

    }
    
}

