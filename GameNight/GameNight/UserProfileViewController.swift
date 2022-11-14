//
//  UserProfileViewController.swift
//  GameNight
//
//  Created by lester on 10/22/22.
//

import UIKit
import Parse
import AlamofireImage


class UserProfileViewController: UIViewController {

    let user = PFUser.current()
    var imagePresent = false
    var imgUrl = URL(string: String())
    @IBOutlet weak var profilePicView: UIImageView!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var fnameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getProfile()
        profilePicView.setRounded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getProfile()
        profilePicView.setRounded()
    }
    
    func getProfile() {
        //Set up User's Profile View
        let query = PFQuery(className:"UserProfile")
        query.whereKey("user", equalTo: user!)
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) scores.")
                // Do something with the found objects
                for object in objects {
                    //Set up the page
                    
                    self.fnameLabel.text = object["firstName"] as? String
                    self.locationLabel.text = object["location"] as? String
                    self.bioLabel.text = object["bio"] as? String
                    
                    let imageFile = object["proPic"] as? PFFileObject
                    if imageFile != nil {
                        self.imagePresent = true
                        let urlString = imageFile?.url!
                        let url = URL(string: urlString!)!
                        self.imgUrl = url
                        self.profilePicView.af.setImage(withURL: url)
                    }
                    
                }
            }
        }
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let UserEditProfileViewController = segue.destination as! UserEditProfileViewController
        UserEditProfileViewController.firstnametext = fnameLabel.text ?? ""
        UserEditProfileViewController.biotext = bioLabel.text ?? ""
        UserEditProfileViewController.locationtext = locationLabel.text ?? ""
        
        if imagePresent == true {
            UserEditProfileViewController.imgUrl = imgUrl
        }
    }

}

extension UIImageView {
    func setRounded() {
        //Make profile image rounded
        self.layer.cornerRadius = self.frame.size.width / 2
        clipsToBounds = true
        //border
        self.layer.borderWidth = 4.0
        self.layer.borderColor = UIColor.white.cgColor
        //shadow
        //self.layer.masksToBounds = false
        //self.layer.shadowColor = UIColor.black.cgColor
        //self.layer.shadowOffset = CGSize(width: 3, height: 3)
        //self.layer.shadowOpacity = 1.0
        //self.layer.shadowRadius = 4.0
    }
}
