//
//  UITextFieldExtensions.swift
//  Travelio
//
//  Created by Rahul Gala on 12/01/21.
//

import UIKit

extension UITextField {
    
    var hasValue:Bool{
        guard text == "" else {
            return true
        }
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageView.image = UIImage(named: "warningIcon")
        imageView.contentMode = .scaleAspectFit
        
        rightView = imageView
        rightViewMode = .unlessEditing
        
        return false
    }
    
}
