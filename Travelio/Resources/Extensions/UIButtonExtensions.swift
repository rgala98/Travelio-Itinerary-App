//
//  UIButtonExtensions.swift
//  Travelio
//
//  Created by Rahul Gala on 02/01/21.
//

import UIKit

extension UIButton {

    func createActionFloatingButton () {
        backgroundColor = Theme.tintColor
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
    }

}
