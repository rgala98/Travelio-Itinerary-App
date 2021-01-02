//
//  UIViewExtentions.swift
//  Travelio
//
//  Created by Rahul Gala on 02/01/21.
//

import UIKit

extension UIView {
    
    func addShadowsAndRoundedCorners() {
        
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.gray.cgColor
        layer.cornerRadius = 12
        
    }
}
