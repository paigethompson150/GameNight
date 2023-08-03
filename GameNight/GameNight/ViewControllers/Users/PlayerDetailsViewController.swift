//
//  PlayerDetailsViewController.swift
//  GameNight
//
//  Created by Paige Thompson on 11/10/22.
//

import UIKit
import Parse

class PlayerDetailsViewController: UIViewController {

    var firstnametext = String()
    var locationtext = String()
    var biotext = String()
    var imgUrl = URL(string: String())
    
    @IBOutlet weak var playerPicView: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerLocationLabel: UILabel!
    @IBOutlet weak var playerBioLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerNameLabel.text = firstnametext
        playerLocationLabel.text = locationtext
        playerBioLabel.text = biotext
        
        if imgUrl != nil {
            self.playerPicView.af.setImage(withURL: imgUrl!)
        }
        
        playerPicView.setRounded()
            
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
