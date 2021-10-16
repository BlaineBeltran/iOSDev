//
//  ReminderListCell.swift
//  Today
//
//  Created by Blaine Beltran on 10/13/21.
//

import UIKit

class ReminderListCell: UITableViewCell {
    
    typealias DoneButtonAction = () -> Void
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var doneButtonAction: DoneButtonAction?
    
  
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        
        doneButtonAction?()
    }
    
}
