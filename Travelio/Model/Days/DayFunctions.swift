//
//  DayFunctions.swift
//  Travelio
//
//  Created by Rahul Gala on 12/01/21.
//

import UIKit

class DayFunctions{
    
    static func createDay(at tripIndex: Int,using dayModel: DayModel){
        //Replace with real data store code
        Data.tripModels[tripIndex].dayModels.append(dayModel)
    }
    
}
