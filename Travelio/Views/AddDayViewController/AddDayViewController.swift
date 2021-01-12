//
//  AddDayViewController.swift
//  Travelio
//
//  Created by Rahul Gala on 12/01/21.
//

import UIKit

class AddDayViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    
    @IBOutlet weak var cancelButton: ActionUIButton!
    @IBOutlet weak var saveButton: ActionUIButton!
    
    var doneSaving: (() -> ())?
    var tripIndexToEdit: Int?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24.0)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func addTrip(_ sender: UIButton) {
        
        guard titleTextField.hasValue, let newTripName = titleTextField.text else {
            return
        }
        
//        if let index = tripIndexToEdit {
//            TripFunctions.updateTrip(at: index, title: newTripName, image: tripImageView.image)
//        }else {
//            TripFunctions.createTrip(tripModel: TripModel(title: newTripName, image: tripImageView.image))
//        }
        
        
        
        if let doneSaving = doneSaving{
            doneSaving()
        }
        dismiss(animated: true)
        
    }

    

    

}
