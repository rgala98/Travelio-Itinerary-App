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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrips { [weak self] in
            self?.tableView.reloadData()
            
        }
        
        view.backgroundColor = Theme.backgroundColor
        
        addTripButton.createActionFloatingButton()
    }
    
}
    
    
    // MARK: TableView Delegates

extension TripsViewController:UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TripsTableViewCell
        
        
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    

}
