//
//  ViewController.swift
//  FoodTracker
//
//  Created by Saajith on 9/21/18.
//  Copyright © 2018 Saajith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mealTextField: UITextField!
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var mealImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addMealText(_ sender: UIButton) {
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
    }
    
}

