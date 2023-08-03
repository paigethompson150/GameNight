//
//  AddGameSessionViewController.swift
//  GameNight
//
//  Created by lester on 11/6/22.
//

import UIKit
import Parse

class AddGameSessionViewController: UIViewController {

    @IBOutlet weak var eventNameLabel: UITextField!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    @IBOutlet weak var eventDescriptionLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        startDatePicker.minimumDate = Date()
        endDatePicker.minimumDate = Date()
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func addGameSession(_ sender: Any) {
        let gameSession = PFObject(className: "GameMeetUp")
        gameSession["eventName"] = eventNameLabel.text
        gameSession["startDate"] = startDatePicker.date
        gameSession["endDate"] = endDatePicker.date
        gameSession["eventDescription"] = eventDescriptionLabel.text
        gameSession["user"] = PFUser.current()
        gameSession["gameName"] = "Catan"
        gameSession["gameId"] = "OIXt3DmJU0"
        
        gameSession.saveInBackground { (success, error) in
            if success {
//                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let gameMeetUpVC = mainStoryboard.instantiateViewController(withIdentifier: "gameMeetUpsViewController") as! GameMeetUpsViewController
//
//                self.present(gameMeetUpVC, animated: true)
                self.performSegue(withIdentifier: "backToMeetUp", sender: nil)
                
            }else {
                print(error?.localizedDescription)
            }
        }
    }
    
    
    @IBAction func addGameSession2(_ sender: Any) {
        
        let gameSession = PFObject(className: "GameMeetUp")
        gameSession["eventName"] = eventNameLabel.text
        gameSession["startDate"] = startDatePicker.date
        gameSession["endDate"] = endDatePicker.date
        gameSession["eventDescription"] = eventDescriptionLabel.text
        gameSession["user"] = PFUser.current()
        gameSession["gameName"] = "Catan"
        gameSession["gameId"] = "OIXt3DmJU0"
        
        gameSession.saveInBackground { (success, error) in
            if success {
//                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let gameMeetUpVC = mainStoryboard.instantiateViewController(withIdentifier: "gameMeetUpsViewController") as! GameMeetUpsViewController
//
//                self.present(gameMeetUpVC, animated: true)
                self.performSegue(withIdentifier: "backToMeetUp", sender: nil)
                
            }else {
                print(error?.localizedDescription)
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
