//
//  MockData.swift
//  Travelio
//
//  Created by Rahul Gala on 03/01/21.
//

import UIKit

class MockData {
    
    static func createMockTripModelData() -> [TripModel]{
        var mockTrips = [TripModel]()
        mockTrips.append(TripModel(title: "Dubai Trip",image: UIImage(named: "dubaiImage"), dayModels: createMockDayModelData()))
        mockTrips.append(TripModel(title: "Shimla"))
        mockTrips.append(TripModel(title: "Trip to Bali"))
        
        return mockTrips
    }
    
    static func createMockDayModelData() -> [DayModel]{
        var dayModels = [DayModel]()
        
        dayModels.append(DayModel(title: "April 18", subtitle: "Departure", data: createMockActivityModelData(sectionTitle: "April 18")))
        dayModels.append(DayModel(title: "April 19", subtitle: "Exploring", data: createMockActivityModelData(sectionTitle: "April 19")))
        dayModels.append(DayModel(title: "April 20", subtitle: "Scuba Diving!", data: createMockActivityModelData(sectionTitle: "April 20")))
        dayModels.append(DayModel(title: "April 21", subtitle: "Volunteering", data: createMockActivityModelData(sectionTitle: "April 21")))
        dayModels.append(DayModel(title: "April 22", subtitle: "Time to go back home", data: createMockActivityModelData(sectionTitle: "April 22")))
        
        
        return dayModels
        
    }
    
    static func createMockActivityModelData(sectionTitle: String) -> [ActivityModel]{
        var activityModels = [ActivityModel]()
        
        switch sectionTitle {
        case "April 18":
            activityModels.append(ActivityModel(title: "SLC", subTitle: "12:25 - 13:45", activityType: ActivityType.flight))
            activityModels.append(ActivityModel(title: "LAX", subTitle: "17:00 - 11:00", activityType: ActivityType.flight))
        case "April 19":
            activityModels.append(ActivityModel(title: "DPS", subTitle: "", activityType: ActivityType.flight))
            activityModels.append(ActivityModel(title: "Bintang Kuta Hotel Checkin", subTitle: "Confirmation: AX76Y2", activityType: ActivityType.hotel))
            activityModels.append(ActivityModel(title: "Pick up rental", subTitle: "Confirmation: 996464", activityType: ActivityType.auto))
            activityModels.append(ActivityModel(title: "Island Excusion", subTitle: "Touring the island", activityType: ActivityType.excursion))
            activityModels.append(ActivityModel(title: "Dinner", subTitle: "at Warung Sanur Segar", activityType: ActivityType.food))
        case "April 20":
            activityModels.append(ActivityModel(title: "Scuba Diving", subTitle: "Checking out the Reefs!", activityType: ActivityType.excursion))
            activityModels.append(ActivityModel(title: "Dinner", subTitle: "at Malaika Secret Moksha", activityType: ActivityType.food))
        case "April 21":
            activityModels.append(ActivityModel(title: "Travel", subTitle: "to Nusa Penida", activityType: ActivityType.flight))
            activityModels.append(ActivityModel(title: "Volunteering", subTitle: "at Tanglad Village", activityType: ActivityType.excursion))
            activityModels.append(ActivityModel(title: "Dinner", subTitle: "at Warung Made", activityType: ActivityType.food))
            activityModels.append(ActivityModel(title: "Travel", subTitle: "back to Denpasar", activityType: ActivityType.flight))
        case "April 22":
            activityModels.append(ActivityModel(title: "Hotel Checkout", subTitle: "from Bintang Kuta Hotel", activityType: ActivityType.hotel))
            activityModels.append(ActivityModel(title: "DPS", subTitle: "Denpasar", activityType: ActivityType.flight))
            activityModels.append(ActivityModel(title: "LAX", subTitle: "Los Angeles", activityType: ActivityType.flight))
            activityModels.append(ActivityModel(title: "SLC", subTitle: "Salt Lake City", activityType: ActivityType.flight))
        default:
            activityModels.append(ActivityModel(title: "", subTitle: "", activityType: ActivityType.excursion))
        }
        
        return activityModels
        
    }
    
}

