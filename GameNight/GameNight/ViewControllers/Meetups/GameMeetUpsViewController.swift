//
//  GameMeetUpsViewController.swift
//  GameNight
//
//  Created by lester on 10/22/22.
//

import UIKit
import Parse

class GameMeetUpsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var gameMeetUps: [PFObject] = []

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
        
//        let innerQuery = PFQuery(className: "UserProfile")
//        innerQuery.whereKey("user", equalTo: PFUser.current())
        //innerQuery.includeKey("user.objectId")
//        innerQuery.whereKey("user", equalTo: PFObject(withoutDataWithClassName: "User", objectId: "5oICSdBi78"))
//        innerQuery.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
//            if let error = error {
//               // Log details of the failure
//               print(error.localizedDescription)
//           } else if let objects = objects {
//               // The find succeeded.
//               print("Successfully retrieved \(objects.count) scores.")
//               // Do something with the found objects
//               for object in objects {
//                   print(object as Any)
//               }
//           }
//        }
        //let innerQuery = PFQuery(className: "UserProfile")
        //innerQuery.whereKey("user", equalTo: PFUser.current())
        let query = PFQuery(className:"GameMeetUp")
        //query.whereKey("user", matchesQuery: innerQuery)
        query.includeKeys(["user", "user.username"])
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                //print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                //print("Successfully retrieved \(objects.count) scores.")
                // Do something with the found objects
                for object in objects {
                    //print(object as Any)
                }
                self.gameMeetUps = objects
                self.tableView.reloadData()
            }
        }
    }
    

    @IBAction func onAddGameSession(_ sender: Any) {
        performSegue(withIdentifier: "addGameSession", sender: nil)
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: "hasLogin")
        defaults.synchronize()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "loginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        delegate.window?.rootViewController = loginViewController
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameMeetUps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameMeetUpTableViewCell", for: indexPath) as! GameMeetUpTableViewCell
        cell.gameMeetUp = gameMeetUps[indexPath.row]
        
//        cell.gameEventLabel.text = gameMeetUps[indexPath.row]["eventName"] as? String
//
////        val pfgameMeetUps[indexPath.row]["user"] as PFUser
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//
//        cell.startDateLabel.text = formatter.string(from: gameMeetUps[indexPath.row]["startDate"] as! Date)
        
//        let query = PFQuery(className:"UserProfile")
//        query.whereKey("user", equalTo: gameMeetUps[indexPath.row]["user"])
//        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
//            if let error = error {
//                // Log details of the failure
//                print(error.localizedDescription)
//            } else if let objects = objects {
//                // The find succeeded.
//                print("Successfully retrieved \(objects.count) scores.")
//                // Do something with the found objects
//
//
//                cell.usernameLabel.text = objects[0]["firstName"] as? String
//
//                return cell
//            }
//        }
        
        return cell

    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameMeetUpDetails" {
                    let cell = sender as! UITableViewCell
                    if let indexPath = tableView.indexPath(for: cell) {
                        let detailsGameMeetUpViewController = segue.destination as! DetailsGameMeetUpViewController
                        detailsGameMeetUpViewController.gameMeetUp = gameMeetUps[indexPath.row]
                        tableView.deselectRow(at: indexPath, animated: true)
                    }
        }
    }
}
