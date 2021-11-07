//
//  ReminderDetailViewDataSource.swift
//  Today
//
//  Created by Blaine Beltran on 10/17/21.
//

import UIKit

class ReminderDetailViewDataSource: NSObject {
    
    enum ReminderRow: Int, CaseIterable {
        case title
        case date
        case time
        case notes
        
        static let timeFormatter: DateFormatter = {
            
            let formatter = DateFormatter()
            formatter.dateStyle = .none
            formatter.timeStyle = .short
            return formatter
        }()
        
        static let dateFormatter: DateFormatter = {
            
            let formatter = DateFormatter()
            formatter.timeStyle = .none
            formatter.dateStyle = .long
            return formatter
        }()
        
        func displayText(for reminder: Reminder?) -> String? {
            
            switch self {
            case .title:
                return reminder?.title ?? "No title"
            case .date:
                guard let date = reminder?.dueDate else { return nil }
                if Locale.current.calendar.isDateInToday(date) {
                    return NSLocalizedString("Today", comment: "Today for date description")
                }
                return Self.dateFormatter.string(from: date)
            case .time:
                guard let date = reminder?.dueDate else { return nil }
                return Self.timeFormatter.string(from: date)
            case .notes:
                return reminder?.notes ?? "No notes"
            }
        }
        
        var cellImage: UIImage? {
            
            switch self {
            case .title:
                return nil
            case .date:
                return UIImage(systemName: "calendar.cicle")
            case .time:
                return UIImage(systemName: "clock")
            case .notes:
                return UIImage(systemName: "square.and.pencil")
            }
        }
    }
    
    private var reminder: Reminder
    
    init(reminder: Reminder) {
        
        self.reminder = reminder
        super.init()
    }
}

extension ReminderDetailViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ReminderRow.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reminderDetailCellIdentifier, for: indexPath)
        let row = ReminderRow(rawValue: indexPath.row)
        
        // Configure the cell this way. cell.textlabel.text etc... will deprecated in future releases of iOS
        // Use the UIListContentConfiguration to configure elements instead
        var content = cell.defaultContentConfiguration()
        content.text = row?.displayText(for: reminder)
        content.image = row?.cellImage
        cell.contentConfiguration = content
        return cell
    }
}
