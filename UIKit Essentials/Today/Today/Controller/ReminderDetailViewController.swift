//
//  ReminderDetailViewController.swift
//  Today
//
//  Created by Blaine Beltran on 10/16/21.
//

import UIKit

class ReminderDetailViewControler: UITableViewController {
    enum ReminderRow: Int, CaseIterable {
        case title
        case date
        case time
        case notes
        
        func  displayText(for reminder: Reminder?) -> String {
            switch self {
            case .title:
                return reminder?.title ?? "No title"
            case .date:
                return reminder?.dueDate.description ?? "No date"
            case .time:
                return reminder?.dueDate.description ?? "No time"
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
    
    var reminder: Reminder?
    
    func configure(with reminder: Reminder) {
        self.reminder = reminder
    }
}

extension ReminderDetailViewControler {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReminderRow.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
