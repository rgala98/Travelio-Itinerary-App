//
//  PopupUIView.swift
//  Travelio
//
//  Created by Rahul Gala on 02/01/21.
//

import UIKit

class PopupUIView: UIView {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.gray.cgColor
        layer.cornerRadius = 12
        
        backgroundColor = Theme.backgroundColor
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
