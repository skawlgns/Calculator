//
//  BorderRadius.swift
//  Calculator
//
//  Created by 남지훈 on 2021/11/19.
//

import UIKit

class BorderRadius: UIButton {
    @IBInspectable var isRadius: Bool = false {
        didSet {
            if isRadius {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
    
}
