//
//  AICalculator.swift
//  AI App Prototype
//
//  Created by Chuck Zumbaugh on 3/19/21.
//

import Foundation

struct AICalculator {
    //Helper methods for calculating due date
    
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
    
    func calculateDueDate(fromDate date: Date, withEt: Bool) -> String {
        switch withEt {
        case true:
            return formatDate((date - 7) + 283)
        default:
            return formatDate(date + 283)
        }
    }
    
    func calculateFetalAge(from bredDate: Date, to checkDate: Date, withEt: Bool) -> Int {
        switch withEt {
        case true:
            return Int((checkDate.timeIntervalSince(bredDate) / 86400).rounded()) + 7
        default:
            return Int((checkDate.timeIntervalSince(bredDate) / 86400).rounded())
        }
    }
    
    func calculateFetalAgeRangeFromBulls(pregCheck checkDate: Date, bullsIn: Date, bullsOut: Date) -> [Int] {
        let minAge = Int((checkDate.timeIntervalSince(bullsOut) / 86400).rounded())
        let maxAge = Int((checkDate.timeIntervalSince(bullsIn) / 86400).rounded())
        
        return [minAge, maxAge]
    }
    
    func calculateDueDateRangeFromBulls(bullsIn: Date, bullsOut: Date) -> String {
        let minDate = formatDate(bullsIn + 283)
        let maxDate = formatDate(bullsOut + 283)
        
        return "Between \(minDate) and \(maxDate)"
    }
    
    func calculateBredDate(from dueDate: Date) -> String {
        return formatDate(dueDate - (283 * 86400))
    }
}
