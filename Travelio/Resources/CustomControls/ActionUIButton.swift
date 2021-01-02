//
//  ActionUIButton.swift
//  Travelio
//
//  Created by Rahul Gala on 02/01/21.
//

import UIKit

class ActionUIButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = Theme.tintColor
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)
    }

}
