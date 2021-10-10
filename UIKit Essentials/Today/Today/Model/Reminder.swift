//
//  Reminder.swift
//  Today
//
//  Created by Blaine Beltran on 10/10/21.
//

import Foundation

struct Reminder {
    var title: String
    var dueDate: Date
    var notes: String? = nil
    var isComplete: Bool = false
}

extension Reminder {
    static var testData = [
        Reminder(title: "Create Jira Board", dueDate: Date().addingTimeInterval(800.0), notes: "Don't forget to integrate GitHub"),
        Reminder(title: "Apply to Apple", dueDate: Date().addingTimeInterval(14000.0), notes: "Update iOS Resume"),
        Reminder(title: "Git ready for SHPE Conference", dueDate: Date().addingTimeInterval(2400.0), notes: "Don't forget to book flight to Orlando", isComplete: true),
        Reminder(title: "Get clothes for SHPE Conference", dueDate: Date().addingTimeInterval(3200.0), notes: "Don't forget to get a new tie"),
        Reminder(title: "Get gas for Car", dueDate: Date().addingTimeInterval(60000.0), notes: "Gas tank on left side of the car"),
        Reminder(title: "Book trip to Canda", dueDate: Date().addingTimeInterval(72000.0), notes: "Don't forget to book hotel", isComplete: true),
        Reminder(title: "Get clothes for Canada", dueDate: Date().addingTimeInterval(83000.0), notes: "Don't It will be cold"),
        Reminder(title: "Get pants", dueDate: Date().addingTimeInterval(92500.0), notes: "Inseame should be 28 inches"),
        Reminder(title: "Clean glasses", dueDate: Date().addingTimeInterval(101000.0), notes: "Don't forget to use dawn soap")
    
    ]
}
