//
//  TripModel.swift
//  Travelio
//
//  Created by Rahul Gala on 01/01/21.
//

import UIKit

struct TripModel {
    
    let id: UUID
    var title: String
    var image: UIImage?
    var dayModels = [DayModel]()
    
    init(title: String, image: UIImage? = nil, dayModels: [DayModel]? = nil) {
        id = UUID()
        self.title = title
        self.image = image
        
        if let dayModels = dayModels {
            self.dayModels = dayModels
        }
    }
    
}
