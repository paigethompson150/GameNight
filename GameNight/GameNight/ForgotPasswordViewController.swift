//
//  ForgotPasswordViewController.swift
//  GameNight
//
//  Created by lester on 10/29/22.
//

import UIKit
import Parse

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBAction func resetPassword(_ sender: Any) {
        guard let email = emailTextField.text else { return }
        
        do {
            try PFUser.requestPasswordReset(forEmail: email)
            performSegue(withIdentifier: "passwordReset", sender: nil)
        } catch {
            print("error")
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
