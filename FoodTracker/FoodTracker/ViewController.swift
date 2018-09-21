//
//  ViewController.swift
//  FoodTracker
//
//  Created by Saajith on 9/21/18.
//  Copyright © 2018 Saajith. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var mealTextField: UITextField!
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var mealImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mealTextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UItextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mealTextField.resignFirstResponder()
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        mealLabel.text = mealTextField.text
    }
    
    //MARK: UIImagePickerControllerDelegate

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
            }
            mealImage.image = selectedImage
            dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    
    @IBAction func onImageTapped(_ sender: UITapGestureRecognizer) {
        print("reached")
        mealTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true , completion: nil)
    }
    
    @IBAction func addMealText(_ sender: UIButton) {
    }
}

