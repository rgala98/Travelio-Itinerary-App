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
    
}
