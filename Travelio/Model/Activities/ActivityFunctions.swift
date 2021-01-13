//
//  ActivityFunctions.swift
//  Travelio
//
//  Created by Rahul Gala on 12/01/21.
//

import Foundation

class  ActivityFunctions {
    
    static func createActivity(at tripIndex: Int, for dayIndex: Int, using activityModel: ActivityModel){
        //Replace with real data store code
        Data.tripModels[tripIndex].dayModels[dayIndex].activityModels.append(activityModel)
    }
    
    static func deleteActivity(at tripIndex: Int, for dayIndex: Int, using activityModel: ActivityModel){
        //Replace with real data store code
        
        let dayModel = Data.tripModels[tripIndex].dayModels[dayIndex]
        
        if let index = dayModel.activityModels.firstIndex(of: activityModel){
            Data.tripModels[tripIndex].dayModels[dayIndex].activityModels.remove(at: index)
        }
    }
    
}
