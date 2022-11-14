//
//  GameDetailsViewController.swift
//  GameNight
//
//  Created by Lawrence Kwok on 11/11/22.
//

import UIKit

class GameDetailsViewController: UIViewController {
    
    var gameName: String!
    var gameSummary: String!
    var imageLink: String!
    var gameDescription: String!
    var minPlayers: Int!
    var maxPlayers: Int!
    var minPlaytime: Int!
    var maxPlaytime: Int!
    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var descriptionView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(gameName as! String)
        navItem.title = gameName
        gameImage.af_setImage(withURL: URL(string: imageLink as! String)!)
        descriptionView.text = gameDescription
        descriptionView.textContainer.maximumNumberOfLines = 10
    }
    

    @IBAction func onReturn(_ sender: Any) {
        self.dismiss(animated: true)
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
