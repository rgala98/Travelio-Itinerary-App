//
//  TripFunctions.swift
//  Travelio
//
//  Created by Rahul Gala on 01/01/21.
//

import UIKit

class TripFunctions {
    
    static func createTrip(tripModel: TripModel){
        
        // Replace with real data store code
        
        Data.tripModels.append(tripModel)
    }
    
    static func readTrips(completion: @escaping () -> ()){
        
        // Replace with real data store code
        
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels = MockData.createMockTripModelData()
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    static func readTrip(by id: UUID, completion: @escaping (TripModel?) -> ()){
        
        // Replace with real data store code
        
        DispatchQueue.global(qos: .userInteractive).async {
            let trip = Data.tripModels.first(where: {$0.id == id})
            
            DispatchQueue.main.async {
                completion(trip)
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
