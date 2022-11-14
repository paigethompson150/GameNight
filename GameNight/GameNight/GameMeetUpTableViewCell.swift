//
//  GameMeetUpTableViewCell.swift
//  GameNight
//
//  Created by lester on 11/6/22.
//

import UIKit
import Parse
import AlamofireImage

class GameMeetUpTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gameEventLabel: UILabel!

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var startDateLabel: UILabel!
    
    var gameMeetUp: PFObject! {
        didSet{
            self.gameEventLabel.text = "Loading"
            self.usernameLabel.text = "Loading"
            self.startDateLabel.text = "Loading"
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
                
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        startDateLabel.text = formatter.string(from: gameMeetUp["startDate"] as! Date)
        
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
        
        
                self.usernameLabel.text = objects[0]["firstName"] as? String
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
