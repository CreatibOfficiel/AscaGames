//
//  MainTheme.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.

import Foundation
import SwiftUI
import UIKit

struct MainTheme {
    let customYellow = Color(#colorLiteral(red: 0.9917605519, green: 0.7754805684, blue: 0.254832238, alpha: 1)) // Still shows as a color swatch
    var customColor: UIColor
    var customUIYellow: UIColor
    var customBackGround: UIColor
    
    init() {
        customColor = UIColor()
        customUIYellow = customColor.hexStringToUIColor(hex: "FBBB3A")
        customBackGround = customColor.hexStringToUIColor(hex: "111419")
    }
}
