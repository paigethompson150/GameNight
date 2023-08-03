//
//  LoginViewController.swift
//  GameNight
//
//  Created by Paige Thompson on 10/23/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var resetPassword: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapResetPassword(sender:)))
        
        resetPassword.addGestureRecognizer(tap)
    }
    
    @objc func tapResetPassword(sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "tapResetPassword", sender: nil)
    }
    
    @IBAction func onLogin(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password)
        { (user, error) in
            if user != nil {
                
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: "hasLogin")
                defaults.synchronize()
                
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error : \(error?.localizedDescription)")
            }
        }
    }
    
    
    @IBAction func onSignup(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
//        let user = PFUser()
//        user.username = usernameField.text
//        user.password = passwordField.text
//
//        user.signUpInBackground { (success, error) in
//            if success {
//                self.performSegue(withIdentifier: "loginSegue", sender: nil)
//            } else {
//                print("Error : \(error?.localizedDescription)")
//            }
//
//        }
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
