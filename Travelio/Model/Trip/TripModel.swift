//
//  TripModel.swift
//  Travelio
//
//  Created by Rahul Gala on 01/01/21.
//

import UIKit

class TripModel {
    
    let id: UUID
    var title: String
    var image: UIImage?
    
    init(title: String, image: UIImage? = nil) {
        id = UUID()
        self.title = title
        self.image = image
    }
    
}
