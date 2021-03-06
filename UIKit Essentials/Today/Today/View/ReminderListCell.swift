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
    
    private var doneButtonAction: DoneButtonAction?
    
  
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        
        doneButtonAction?()
    }
    
    func configure(title: String, dateText: String, isDone: Bool, doneButtonAction: @escaping DoneButtonAction) {
        titleLabel.text = title
        dateLabel.text = dateText
        let image = isDone ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
        doneButton.setImage(image, for: .normal)
        self.doneButtonAction = doneButtonAction
        
    }
    
}
