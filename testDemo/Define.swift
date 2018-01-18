//
//  Define.swift
//  testDemo
//
//  Created by 威威孙 on 2017/6/1.
//  Copyright © 2017年 威威孙. All rights reserved.
//

import Foundation

let SCREENSIZE_WIDTH:Float = Float(UIScreen.main.bounds.size.width)
let SCREENSIZE_HEIGHT:Float = Float(UIScreen.main.bounds.size.height)

extension UIColor {
    
    /**
     *  16进制 转 RGBA
     */
    class func RGBAColorFromHex(rgb:Int, alpha: CGFloat) ->UIColor {
        
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16))/255.0,
                       green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                       alpha: alpha)
    }
    
    /**
     *  16进制 转 RGB
     */
    class func RGBColorFromHex(rgb:Int) -> UIColor {
        
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16))/255.0,
                       green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                       alpha: 1.0)
    }
    
    class func randomColour() -> UIColor {
        return UIColor(red: CGFloat(Float(arc4random()%255) / 255.0),
                       green:CGFloat(Float(arc4random()%255) / 255.0),
                       blue: CGFloat(Float(arc4random()%255) / 255.0),
                       alpha: 1.0)
    }
}
