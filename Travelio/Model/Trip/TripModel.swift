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
    var dayModels = [DayModel](){
        didSet{
            // Called when a new value is assigned to the day models
//            dayModels = dayModels.sorted(by: { (dayModel1, daymodel2) -> Bool in
//                dayModel1.title < daymodel2.title
//            })
            
            // ShortHand for sorting
//            dayModels = dayModels.sorted(by: {$0.title < $1.title })
            
            dayModels = dayModels.sorted(by: <)
        }
    }
    
    init(title: String, image: UIImage? = nil, dayModels: [DayModel]? = nil) {
        id = UUID()
        self.title = title
        self.image = image
        
        if let dayModels = dayModels {
            self.dayModels = dayModels
        }
    }
    
}
