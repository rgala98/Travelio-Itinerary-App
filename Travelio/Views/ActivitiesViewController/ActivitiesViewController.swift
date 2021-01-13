//
//  ActivitiesViewController.swift
//  Travelio
//
//  Created by Rahul Gala on 03/01/21.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    
    var tripId: UUID!
    var tripTitle = ""
    var tripModel: TripModel?
    var sectionHeaderHeight: CGFloat = 0.0
    
    @IBOutlet weak var addButton: ActionUIButton!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate func updateTableViewWithTripData() {
        TripFunctions.readTrip(by: tripId) { [weak self] (model) in
            
            guard let self = self else {return}
            self.tripModel = model
            
            guard let model = model else {return}
            
            self.backgroundImageView.image = model.image
            
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = tripTitle
        addButton.createActionFloatingButton()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        updateTableViewWithTripData()
        
        sectionHeaderHeight = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier)?.contentView.bounds.height ?? 0
    }
    
    @IBAction func addAction(_ sender: ActionUIButton) {
        let alert = UIAlertController(title: "Which one would you like to add?", message: nil, preferredStyle: .actionSheet)
        
        let dayAction = UIAlertAction(title: "Day", style: .default, handler: handleAddDay)
        
        let activityAction = UIAlertAction(title: "Activity", style: .default, handler: handleAddActivity)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        
        if tripModel?.dayModels.count == 0{
            activityAction.isEnabled = false
        }
        
        alert.addAction(dayAction)
        alert.addAction(activityAction)
        alert.addAction(cancel)
        
        // To add the action sheet to iPads
        alert.popoverPresentationController?.sourceView = sender
        // To properly point the arrow from the button
        alert.popoverPresentationController?.sourceRect = CGRect(x: 0, y: -4, width: sender.bounds.width, height: sender.bounds.height)
        
        alert.view.tintColor = Theme.tintColor
        
        present(alert, animated: true, completion: nil)
    }
    
    
    fileprivate func getTripIndex() -> Int! {
        return Data.tripModels.firstIndex(where: { (tripModel) -> Bool in
            tripModel.id == tripId
        })
    }
    
    func handleAddDay(action: UIAlertAction){
        let vc  = AddDayViewController.getInstance() as! AddDayViewController
        vc.tripModel = tripModel
        vc.tripIndex = getTripIndex()
        vc.doneSaving = { [weak self] dayModel in
            guard let self = self else {return}
            
            
            self.tripModel?.dayModels.append(dayModel)
            let indexArray = [self.tripModel?.dayModels.firstIndex(of: dayModel) ?? 0]
            
            self.tableView.insertSections(IndexSet(indexArray), with: .automatic)
        }
        present(vc, animated: true, completion: nil)
    }
    
    func handleAddActivity(action: UIAlertAction){
        
        let vc = AddActivityViewController.getInstance() as! AddActivityViewController
        vc.tripModel = tripModel
        vc.tripIndex = getTripIndex()
        
        vc.doneSaving = { [weak self] dayIndex, activityModel in
            guard let self = self else {return}
            
            
            self.tripModel?.dayModels[dayIndex].activityModels.append(activityModel)
            
            let row = (self.tripModel?.dayModels[dayIndex].activityModels.count)! - 1
            
            let indexPath = IndexPath(row: row, section: dayIndex)
            
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        present(vc, animated: true, completion: nil)
        
    }
    
    
}

// MARK: - Table View Delegates

extension ActivitiesViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripModel?.dayModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        
        return sectionHeaderHeight
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let dayModel = tripModel?.dayModels[section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier ) as! HeaderTableViewCell
        
        cell.setup(model: dayModel!)
        
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivityTableViewCell.identifier) as! ActivityTableViewCell
        
        cell.setup(model: model!)
        return cell
    }
    
    // MARK: Swipe Actions
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let activityModel = tripModel!.dayModels[indexPath.section].activityModels[indexPath.row]
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view,  actionPerformed: @escaping (Bool) -> ()) in
            
            // Ask before Delete
            let alert = UIAlertController(title: "Delete Activity", message: "Are you sure you want to delete this activity: \(activityModel.title)?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
                actionPerformed(false)
            }))
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
                // Perform Delete
                
                ActivityFunctions.deleteActivity(at: self.getTripIndex(), for: indexPath.section, using: activityModel)
                self.tripModel!.dayModels[indexPath.section].activityModels.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true)
            }))
            
            self.present(alert, animated: true, completion: nil)
            
            
            
        }
        
        delete.image = UIImage(named: "closeIcon")
        delete.image?.withTintColor(UIColor.white)
        
        
        return UISwipeActionsConfiguration(actions: [delete])
        
    }
    
    
}


