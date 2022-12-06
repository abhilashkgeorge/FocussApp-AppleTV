//
//  ViewController.swift
//  FocusApp
//
//  Created by Abhilash k George on 02/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFeildTip: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var textFeild: UITextField!
    
    
    var focusGuide: UIFocusGuide!
    
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        return [textFeild]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        focusGuide = UIFocusGuide()
        view.addLayoutGuide(focusGuide)
        nextButton.setTitle("Next", for: .normal)
        focusGuide.topAnchor.constraint(equalTo: textFeild.bottomAnchor).isActive = true
        focusGuide.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        focusGuide.heightAnchor.constraint(equalToConstant: 1).isActive = true
        restoresFocusAfterTransition = false
        focusGuide.preferredFocusEnvironments = [nextButton]
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert(_ sender: Any) {
        let ac = UIAlertController(title: "Test", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(ac, animated: true)
    
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if context.nextFocusedView == textFeild {
            focusGuide.preferredFocusEnvironments = [nextButton]
            coordinator.addCoordinatedAnimations({
                self.textFeildTip.alpha = 1
            })
        } else {
            focusGuide.preferredFocusEnvironments = [textFeild]
            coordinator.addCoordinatedAnimations({
                self.textFeildTip.alpha = 0
            })
        }
        
        
    }
}

