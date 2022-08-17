//
//  RoundButton.swift
//  Calculater
//
//  Created by 백시훈 on 2022/08/17.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var isRound: Bool = false{
        didSet{
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }

}
