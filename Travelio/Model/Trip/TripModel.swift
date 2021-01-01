//
//  TripModel.swift
//  Travelio
//
//  Created by Rahul Gala on 01/01/21.
//

import Foundation

class TripModel {
    
    var id: String!
    var title: String!
    
    init(title: String) {
        id = UUID().uuidString
        self.title = title
    }
    
}
