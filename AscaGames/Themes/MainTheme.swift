//
//  MainTheme.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import Foundation
import UIKit

struct MainTheme {
    var customColor: UIColor
    var customYellow: UIColor
    var customBackGround: UIColor
    
    init() {
        customColor = UIColor()
        customYellow = customColor.hexStringToUIColor(hex: "FBBB3A")
        customBackGround = customColor.hexStringToUIColor(hex: "111419")
    }
}
