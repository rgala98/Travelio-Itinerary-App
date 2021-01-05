//
//  DayModel.swift
//  Travelio
//
//  Created by Rahul Gala on 03/01/21.
//

import Foundation


struct DayModel {
    var id: String!
    var title = ""
    var subtitle = ""
    var activityModels = [ActivityModel]()
    
    init(title: String, subtitle: String, data: [ActivityModel]?) {
        id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        
        if let data = data{
            self.activityModels = data
        }
    }
}
