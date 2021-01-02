//
//  AddTripViewController.swift
//  Travelio
//
//  Created by Rahul Gala on 02/01/21.
//

import UIKit

class AddTripViewController: UIViewController {
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var addTripButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24.0)
        
        
        
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func addTrip(_ sender: UIButton) {
        dismiss(animated: true)

    }
    
    
    
}
