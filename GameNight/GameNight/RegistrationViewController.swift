//
//  RegistrationViewController.swift
//  GameNight
//
//  Created by lester on 10/24/22.
//

import UIKit
import Parse

class RegistrationViewController: UIViewController {
    

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var firstNameField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!

    @IBOutlet weak var emailField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //scrollView.isUserInteractionEnabled = true
        //scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: scrollView.bounds.height * 4)

        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
//        scrollView.isUserInteractionEnabled = true
        //scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: scrollView.bounds.height * 4)

    }
    

    @IBAction func onSignUp(_ sender: Any) {
        
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user.email = emailField.text
        

        user.signUpInBackground { [self] (success, error) in
            if success {
                print("signed up")
                
                let profile = PFObject(className: "UserProfile")
                let user = PFUser.current()
                profile["user"] = user
                profile["firstName"] = firstNameField.text
                profile["lastName"] = lastNameField.text
                
                profile.saveInBackground { (success, error) in
                    if success {
                        print("profile saved")
                        performSegue(withIdentifier: "registrationComplete", sender: nil)
                    } else {
                        print("Error : \(error?.localizedDescription)")
                    }
                }
            } else {
                print("Error : \(error?.localizedDescription)")
            }

        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
