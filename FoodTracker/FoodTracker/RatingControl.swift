//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Saajith on 9/21/18.
//  Copyright © 2018 Saajith. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
   
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet{
            setUpButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setUpButtons()
        }
    }
    
    private var buttonArray = [UIButton]()
    var rating = 0 {
        
        didSet {
            updateButtonSelectionState()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUpButtons()
    }

    private func setUpButtons() {
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for button in  buttonArray{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        buttonArray.removeAll()
        
        for index in 0..<starCount{
            
            let ratingButton = UIButton()
            
            // Set the button images
            ratingButton.setImage(emptyStar, for: .normal)
            ratingButton.setImage(filledStar, for: .selected)
            ratingButton.setImage(highlightedStar, for: .highlighted)
            ratingButton.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // Add constraints
            ratingButton.translatesAutoresizingMaskIntoConstraints = false
            ratingButton.heightAnchor.constraint(equalToConstant: starSize.height).isActive =  true
            ratingButton.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Set the accessibility label
            ratingButton.accessibilityLabel = "Set \(index + 1) star rating"
            
            // Setup the button action
            ratingButton.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            addArrangedSubview(ratingButton)
            buttonArray.append(ratingButton)
        }
        updateButtonSelectionState()
    }
    
    
    //MARK: Button action
    @objc func ratingButtonTapped(button: UIButton){
        guard let index = buttonArray.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtonTapped)")
        }
        let selectedRating = index+1
       
            if selectedRating == rating {
                
                // If the selected star represents the current rating, reset the rating to 0.
                rating = 0
            } else {
                // Otherwise set the rating to the selected star
                rating = selectedRating
            }
    }
    
    
    func updateButtonSelectionState() {
        
        for(index, button) in buttonArray.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
            
            // Set the hint string for the currently selected star
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
            
            // Calculate the value string
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
            
            // Assign the hint string and value string
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
}
