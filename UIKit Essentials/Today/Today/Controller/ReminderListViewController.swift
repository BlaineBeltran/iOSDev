//
//  ViewController.swift
//  Today
//
//  Created by Blaine Beltran on 10/10/21.
//

import UIKit

class ReminderListViewController: UITableViewController {
    
    @IBOutlet var filterSegmenteedControl: UISegmentedControl!
    
    
    private var reminderListDataSource: ReminderListDataSource?
    private var filter: ReminderListDataSource.Filter {
        return ReminderListDataSource.Filter(rawValue: filterSegmenteedControl.selectedSegmentIndex) ?? .today
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.reminderDetailSegue,
           let destination = segue.destination as? ReminderDetailViewControler,
           let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            let rowIndex = indexPath.row
            guard let reminder = reminderListDataSource?.reminder(at: rowIndex) else {
                fatalError("Couldn't find data source for reminder list")
            }
            destination.configure(with: reminder) { reminder in
                self.reminderListDataSource?.update(reminder, at: rowIndex)
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        reminderListDataSource = ReminderListDataSource()
        tableView.dataSource = reminderListDataSource
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let navigationController = navigationController, navigationController.isToolbarHidden {
            navigationController.setToolbarHidden(false, animated: animated)
        }
    }
    @IBAction func addButtonTriggered(_ sender: UIBarButtonItem) {
        
        addReminder()
    }
    @IBAction func filterControlPressed(_ sender: UISegmentedControl) {
        
        reminderListDataSource?.filter = filter
        tableView.reloadData()
    }
    
    private func addReminder() {
        
        let storyBoard = UIStoryboard(name: Constants.mainStoryboardName, bundle: nil)
        let detailViewController: ReminderDetailViewControler = storyBoard.instantiateViewController(identifier: Constants.detailViewControllerIdentifier)
        let reminder = Reminder(title: "New Reminder", dueDate: Date())
        detailViewController.configure(with: reminder, isNew: true, addAction: { reminder in
            self.reminderListDataSource?.add(reminder)
            self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        })
        let navigationController = UINavigationController(rootViewController: detailViewController)
        present(navigationController, animated: true, completion: nil)
    }
}



