//
//  AddActivityViewController.swift
//  Travelio
//
//  Created by Rahul Gala on 12/01/21.
//

import UIKit

class AddActivityViewController: UITableViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dayPickerView: UIPickerView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subtitleTextField: UITextField!
    
    @IBOutlet var activityTypeButtons: [UIButton]!
    
    
    var tripIndex: Int!
    var tripModel: TripModel!
    var dayIndexToEdit: Int?
    var activityModelToEdit: ActivityModel!
    
    var doneSaving: ((Int, ActivityModel) -> ())?
    
    var doneUpdating: ((Int, Int, ActivityModel)-> ())?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24.0)
        dayPickerView.dataSource = self
        dayPickerView.delegate = self
        
        if let dayIndex = dayIndexToEdit, let activityModel = activityModelToEdit{
            
            // Update Activity: Populate the popup
            titleLabel.text = "Edit Activity"
            
            // Select the Day in the picker view
            dayPickerView.selectRow(dayIndex, inComponent: 0, animated: true)
            
            //Populate the Activity Data
            // TODO: Set the selected activity type button
            activityTypeSelected(activityTypeButtons[activityModel.activityType.rawValue])
            
            titleTextField.text = activityModel.title
            subtitleTextField.text = activityModel.subTitle
        } else{
            // New Actitity: Set to default values
            activityTypeSelected(activityTypeButtons[ActivityType.excursion.rawValue])
        }
    }
    

  
    
    @IBAction func activityTypeSelected(_ sender: UIButton) {
        
        activityTypeButtons.forEach({$0.tintColor = Theme.accent})
        
        sender.tintColor = Theme.tintColor
    }
    
    
    @IBAction func save(_ sender: ActionUIButton) {
        
        guard titleTextField.hasValue, let newTitle = titleTextField.text else {
            return
        }
        
        let activitytype: ActivityType = getSelectedActivityType()
        
        let newDayIndex = dayPickerView.selectedRow(inComponent: 0)
        
        
        if activityModelToEdit != nil{
            // Update the ACTIVITY
            activityModelToEdit.activityType = activitytype
            activityModelToEdit.title = newTitle
            activityModelToEdit.subTitle = subtitleTextField.text ?? ""
            
            ActivityFunctions.updateActivity(at: tripIndex, oldDayIndex: dayIndexToEdit!, newDayIndex: newDayIndex, using: activityModelToEdit)
            
            if let doneUpdating = doneUpdating, let oldDayIndex = dayIndexToEdit {
                doneUpdating(oldDayIndex, newDayIndex, activityModelToEdit)
            }
        } else {
            // New Activity
            let activityModel =  ActivityModel(title: newTitle, subTitle: subtitleTextField.text ?? "", activityType: activitytype)
            ActivityFunctions.createActivity(at: tripIndex, for: newDayIndex, using: activityModel)
            
            if let doneSaving = doneSaving{
                doneSaving(newDayIndex, activityModel)
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func getSelectedActivityType() -> ActivityType{
        for (index, button) in activityTypeButtons.enumerated(){
            if button.tintColor == Theme.tintColor{
                return ActivityType(rawValue: index) ?? .excursion
            }
        }
        
        return .excursion
    }
    
    
    @IBAction func cancel(_ sender: ActionUIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    
}








extension AddActivityViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tripModel.dayModels.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tripModel.dayModels[row].title.mediumDate
    }
    
    
    
    
}

