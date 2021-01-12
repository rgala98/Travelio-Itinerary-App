//
//  DateExtensions.swift
//  Travelio
//
//  Created by Rahul Gala on 12/01/21.
//

import Foundation

extension Date{
    func add(days: Int) -> Date{
        return Calendar.current.date(byAdding: .day, value: days, to: Date())!
    }
}
