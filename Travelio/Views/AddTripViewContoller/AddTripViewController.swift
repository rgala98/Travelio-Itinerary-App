//
//  AddTripViewController.swift
//  Travelio
//
//  Created by Rahul Gala on 02/01/21.
//

import UIKit
import Photos

class AddTripViewController: UIViewController {
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addTripButton: UIButton!
    @IBOutlet weak var tripImageView: UIImageView!
    
    @IBOutlet weak var addImageButton: UIButton!
    
    var doneSaving: (() -> ())?
    var tripIndexToEdit: Int?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24.0)
        
        //DropShadow on TitleLabel
        titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOffset = CGSize.zero
        titleLabel.layer.shadowRadius = 5
        
        tripImageView.layer.cornerRadius = 12
        
        if let index = tripIndexToEdit {
            
            let trip = Data.tripModels[index]
            
            tripTextField.insertText(trip.title)
            tripImageView.image = trip.image
            titleLabel.text = "Edit Trip"
        }
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func addTrip(_ sender: UIButton) {
        
        guard tripTextField.hasValue, let newTripName = tripTextField.text else {
            return
        }
        
        if let index = tripIndexToEdit {
            TripFunctions.updateTrip(at: index, title: newTripName, image: tripImageView.image)
        }else {
            TripFunctions.createTrip(tripModel: TripModel(title: newTripName, image: tripImageView.image))
        }
        
        
        
        if let doneSaving = doneSaving{
            doneSaving()
        }
        dismiss(animated: true)
        
    }
    
    
    fileprivate func presentPhotoPickerController() {
        DispatchQueue.main.async {
            let imagePickerController = UIImagePickerController()
            imagePickerController.allowsEditing = true
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true,completion: nil)
        }
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        
        
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
            case .authorized:
                self.presentPhotoPickerController()
                break
            case .notDetermined:
                if status == PHAuthorizationStatus.authorized{
                    self.presentPhotoPickerController()
                }
                break
            case .restricted:
                let alert = UIAlertController(title: "Photo Library Restricted", message: "Access to the photo library is restricted and cannot be accessed at this time.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            case .denied:
                let alert = UIAlertController(title: "Photo Library Access Denied", message: "Access to the photo library was previously denied. Please go to Settings if you wish to change this", preferredStyle: .alert)
                let settingsAction = UIAlertAction(title: "Go to Settings", style: .default){(action) in
                    DispatchQueue.main.async {
                        let url = URL(string: UIApplication.openSettingsURLString)!
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
                let cancelAction =  UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(settingsAction)
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)
                
            case .limited:
                let alert = UIAlertController(title: "Photo Library Restricted", message: "Access to the photo library is restricted and cannot be accessed at this time.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            @unknown default:
                print("It looks like Apple added a new enum to PHAuthorizationStatus")
                break
            }
            
            
        }
        
        
    }
    
}


extension AddTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.editedImage] as? UIImage {
            self.tripImageView.image = image
        } else if let image = info[.originalImage] as? UIImage {
            self.tripImageView.image = image
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
    }
}




