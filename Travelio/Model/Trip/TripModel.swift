//
//  TripModel.swift
//  Travelio
//
//  Created by Rahul Gala on 01/01/21.
//

import Foundation

class TripModel {
    
    let id: UUID
    var title: String
    
    init(title: String) {
        id = UUID()
        self.title = title
    }
    
}
