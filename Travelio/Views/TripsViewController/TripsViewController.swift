//
//  TripsViewController.swift
//  Travelio
//
//  Created by Rahul Gala on 02/01/21.
//

import UIKit

class TripsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        TripFunctions.readTrips { [weak self] in
            self?.tableView.reloadData()
            
        }
    }
    
    
    // MARK: TableView Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "tableCell")
        
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "tableCell")
        }
         
        cell!.textLabel?.text = Data.tripModels[indexPath.row].title
        
        return cell!
    }
    

}
