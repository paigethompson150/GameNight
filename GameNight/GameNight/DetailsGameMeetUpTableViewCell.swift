//
//  DetailsGameMeetUpTableViewCell.swift
//  GameNight
//
//  Created by lester on 11/7/22.
//

import UIKit
import Parse

class DetailsGameMeetUpTableViewCell: UITableViewCell {

    @IBOutlet weak var gameEventLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    
    @IBOutlet weak var nameFirstLastLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
   
    @IBOutlet weak var startDateLabel: UILabel!
    
    @IBOutlet weak var endDateLabel: UILabel!
    
    @IBOutlet weak var viewGameDescriptionLabel: UILabel!
    
    @IBOutlet weak var eventDescription: UILabel!
    var gameMeetUp: PFObject! {
        didSet{
            fetchContents()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fetchContents() -> Void {
        
        gameEventLabel.text = gameMeetUp["eventName"] as? String
        
        gameNameLabel.text = gameMeetUp["gameName"] as? String
        
        eventDescription.text = gameMeetUp["eventDescription"] as? String
                
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        startDateLabel.text = formatter.string(from: gameMeetUp["startDate"] as! Date)
        
        endDateLabel.text = formatter.string(from: gameMeetUp["endDate"] as! Date)
        
        let query = PFQuery(className:"UserProfile")
        query.whereKey("user", equalTo: gameMeetUp["user"])
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                //print("Successfully retrieved \(objects.count) scores.")
                // Do something with the found objects
                //print(objects[0] as Any)
                
                var firstName = objects[0]["firstName"] as! String
                
                var lastName = objects[0]["lastName"] as! String
                
                self.nameFirstLastLabel.text = "\(firstName) \(lastName)"
                
                var user = objects[0]["user"] as! PFUser


                var query = PFUser.query()
                query?.whereKey("objectId", equalTo: user.objectId)
                query?.findObjectsInBackground { (users: [PFObject]?, error: Error?) in
                    if let error = error  {
                        print(error.localizedDescription)
                    }else {
                        self.usernameLabel.text = users![0]["username"] as! String
                    }
                }
                //let imageName = "yourImage.png" let image = UIImage(named: imageName) let imageView = UIImageView(image: image!)
                let userImageFile = objects[0]["proPic"] as? PFFileObject
                userImageFile?.getDataInBackground { (imageData: Data?, error: Error?) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else if let imageData = imageData {
                        let image = UIImage(data:imageData)
                        self.profileImageView.image = image
                    }
                }
            }
        }
    }
}
