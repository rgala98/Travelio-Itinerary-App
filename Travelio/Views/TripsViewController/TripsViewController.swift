//
//  TripsViewController.swift
//  Travelio
//
//  Created by Rahul Gala on 02/01/21.
//

import UIKit

class TripsViewController: UIViewController  {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addTripButton: UIButton!
    @IBOutlet var helpView: UIVisualEffectView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    var seenHelpView = "seenHelpView"

    
    var tripIndexToEdit: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableFooterView = UIView() 
        
        TripFunctions.readTrips { [unowned self] in
            self .tableView.reloadData()
            
            if Data.tripModels.count > 0{
                if !UserDefaults.standard.bool(forKey: self.seenHelpView){
                    self.view.addSubview(self.helpView)
                    self.helpView.frame = self.view.bounds
                }
            }
            
        }
        
        
        
        view.backgroundColor = Theme.backgroundColor
        
        addTripButton.createActionFloatingButton()
        
        
        // ANIMATION FOR THE THE LOGO
        
        let radians = CGFloat(300 * Double.pi/180)
        
        UIView.animate(withDuration: 1.5, delay: 0, options: [.curveEaseIn]) {
            self.logoImageView.alpha = 0
            self.logoImageView.transform = CGAffineTransform(rotationAngle: -radians)
                .scaledBy(x: 3, y: 3)
            
            let yRotation = CATransform3DMakeRotation(CGFloat(30 * Double.pi/180), 0, 1, 0)
            self.logoImageView.layer.transform = CATransform3DConcat(self.logoImageView.layer.transform, yRotation)
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let popup = segue.destination as! AddTripViewController
            popup.tripIndexToEdit = self.tripIndexToEdit
            popup.doneSaving = { [weak self] in
                guard let self = self else {return}
                self.tableView.reloadData()
            }
            
            tripIndexToEdit = nil
        }
    }
    
    
    
    @IBAction func closeHelpView(_ sender: ActionUIButton) {
        
        UIView.animate(withDuration: 0.7) {
            self.helpView.alpha = 0
        } completion: { (success) in
            self.helpView.removeFromSuperview()
            UserDefaults.standard.set(true, forKey: self.seenHelpView)
        }

        
        
    }
    
    
}
    
    
    // MARK: TableView Delegates

extension TripsViewController:UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TripsTableViewCell.identifier) as! TripsTableViewCell
        
        
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let trip = Data.tripModels[indexPath.row]
        
        let vc = ActivitiesViewController.getInstance() as! ActivitiesViewController
        vc.tripId = trip.id
        vc.tripTitle = trip.title
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: Swipe Actions
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let trip = Data.tripModels[indexPath.row]
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view,  actionPerformed: @escaping (Bool) -> ()) in
            
            // Ask before Delete
            let alert = UIAlertController(title: "Delete Trip", message: "Are you sure you want to delete this trip: \(trip.title)?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
                actionPerformed(false)
            }))
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
                // Perform Delete
                
                TripFunctions.deleteTrip(index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true)
            }))
            
            self.present(alert, animated: true, completion: nil)
            
            
            
        }
        
        delete.image = UIImage(named: "closeIcon")
        delete.image?.withTintColor(UIColor.white)
        
        
        return UISwipeActionsConfiguration(actions: [delete])

    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed: @escaping(Bool) -> ()) in
            
            self.tripIndexToEdit = indexPath.row
            self.performSegue(withIdentifier: "toAddTripSegue", sender: nil)
            actionPerformed(true)
        }
        
        edit.image = UIImage(named: "editIcon")
        edit.image?.withTintColor(UIColor.white)
        edit.backgroundColor = UIColor.systemBlue
        
        
        
        return UISwipeActionsConfiguration(actions: [edit])
    }

}
