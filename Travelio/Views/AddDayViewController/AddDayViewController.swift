//
//  AddDayViewController.swift
//  Travelio
//
//  Created by Rahul Gala on 12/01/21.
//

import UIKit

class AddDayViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var descTextField: UITextField!
    
    @IBOutlet weak var cancelButton: ActionUIButton!
    @IBOutlet weak var saveButton: ActionUIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var doneSaving: ((DayModel) -> ())?
    var tripIndex: Int!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24.0)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func save(_ sender: UIButton) {
        
//        guard titleTextField.hasValue, let newTitle = titleTextField.text else { return }
        
        let dayModel = DayModel(title: datePicker.date, subtitle: descTextField.text ?? "", data: nil)
        
        DayFunctions.createDays(at: tripIndex, using: dayModel)
        
        
        if let doneSaving = doneSaving{
            doneSaving(dayModel)
        }
        dismiss(animated: true)
        
    }

    
    @IBAction func done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    

}
