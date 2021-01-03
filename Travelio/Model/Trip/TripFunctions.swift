//
//  TripFunctions.swift
//  Travelio
//
//  Created by Rahul Gala on 01/01/21.
//

import UIKit

class TripFunctions {
    
    static func createTrip(tripModel: TripModel){
        Data.tripModels.append(tripModel)
    }
    
    static func readTrips(completion: @escaping () -> ()){
        
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Dubai Trip"))
                Data.tripModels.append(TripModel(title: "Shimla"))
                Data.tripModels.append(TripModel(title: "Trip to Bali"))
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
       
        
    }
    
    static func updateTrip(at index: Int, title:String, image: UIImage? = nil){
        
        // Ideally you will have to go to background thread to update this trip in any database
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image
    }
    
    static func deleteTrip(index: Int){
        
        Data.tripModels.remove(at: index)
        
    }
    
}
