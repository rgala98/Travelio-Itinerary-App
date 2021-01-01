//
//  TripFunctions.swift
//  Travelio
//
//  Created by Rahul Gala on 01/01/21.
//

import Foundation

class TripFunctions {
    
    static func createTrip(tripModel: TripModel){
        
    }
    
    static func readTrips(){
        if Data.tripModels.count == 0 {
            Data.tripModels.append(TripModel(title: "Dubai Trip"))
            Data.tripModels.append(TripModel(title: "Shimla"))
            Data.tripModels.append(TripModel(title: "Trip to Bali"))
            //new
        }
    }
    
    static func updateTrip(tripModel: TripModel){
        
    }
    
    static func deleteTrip(tripModel: TripModel){
        
    }
    
}
