//
//  UIViewControllerExtensions.swift
//  Travelio
//
//  Created by Rahul Gala on 12/01/21.
//

import UIKit

extension UIViewController {
    
    /**
     Just returns the initial viewcontroller on storyboard.
     */

    static func getInstance() -> UIViewController{
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController()!
    }

}
