//
//  PlayersViewController.swift
//  GameNight
//
//  Created by lester on 10/22/22.
//

import UIKit
import Parse
import AlamofireImage

class PlayersViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var players = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        let query = PFQuery(className:"UserProfile")
        query.whereKey("user", notEqualTo: PFUser.current()!)
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) scores.")
                // Do something with the found objects
                for object in objects {
                    self.players.append(object)
                }
                self.collectionView.reloadData()
            }
        }
        
        let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        flow.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        flow.minimumInteritemSpacing = 0;
        flow.minimumLineSpacing = 0;
        collectionView.delegate = self
        collectionView.dataSource = self
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("You tapped me")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(players.count)
        return players.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerCollectionViewCell", for: indexPath) as! PlayerCollectionViewCell
        
        let player = players[indexPath.item]
        cell.nameLabel.text = player["firstName"] as? String
        
        let imageFile = player["proPic"] as? PFFileObject
        if imageFile != nil {
            let urlString = imageFile?.url!
            let url = URL(string: urlString!)!
            cell.profilePicView.af.setImage(withURL: url)
        }
        
        
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        //Find the selected player
        let cell = sender as! PlayerCollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)!
        let player = players[indexPath.row]
        
        let PlayerDetailsViewController = segue.destination as! PlayerDetailsViewController
        PlayerDetailsViewController.firstnametext = player["firstName"] as? String ?? ""
        PlayerDetailsViewController.biotext = player["bio"] as? String ?? ""
        PlayerDetailsViewController.locationtext = player["location"] as? String ?? ""
        
        let imageFile = player["proPic"] as? PFFileObject
        if imageFile != nil {
            let urlString = imageFile?.url!
            let url = URL(string: urlString!)
            PlayerDetailsViewController.imgUrl = url
        }
        
        //Pass player to details controller
        let PlayerDetailsviewController = segue.destination as! PlayerDetailsViewController

    }

}

//extension PlayersViewController: UICollectionViewDelegateFlowLayout {
    
//}
