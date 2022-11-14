//
//  ForgotPasswordConfirmationViewController.swift
//  GameNight
//
//  Created by lester on 10/29/22.
//

import UIKit

class ForgotPasswordConfirmationViewController: UIViewController {

    @IBAction func goBackToSignIn(_ sender: Any) {
        performSegue(withIdentifier: "goBackToSignIn", sender: nil)
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
