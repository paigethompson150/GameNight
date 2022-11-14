//
//  CategoryGridController.swift
//  GameNight
//
//  Created by Lawrence Kwok on 11/10/22.
//

import UIKit
import AlamofireImage

class CategoryGridController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var gameGridView: UICollectionView!
    
    var categoryName: String!
    var selectCategory: String!
    
    var queryGames = [] as! [game]
    
    struct Response: Codable {
        let count: Int
        let games: [game]
    }
    
    struct game: Codable {
        let id: String
        let name: String
        //let price: String
        //let min_players: Int
        //let max_players: Int
        //let min_playtime: Int
        //let max_playtime: Int
        //let min_age: Int
        let description: String
        let image_url: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = categoryName + " Games"
        // Do any additional setup after loading the view.
        gameGridView.delegate = self
        gameGridView.dataSource = self
        
        let layout = gameGridView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let address = "https://api.boardgameatlas.com/api/search?categories=" + self.selectCategory + "&limit=100&client_id=b6GpveZyti"

        let url = URL(string: address)
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let parsedJSON = try jsonDecoder.decode(Response.self, from: data)
                    for items in parsedJSON.games {
                        self.queryGames.append(items)
                    }
                } catch {
                    print(error)
                }
                DispatchQueue.main.async {
                    self.gameGridView.reloadData()
                }
            }
            else {
                print(error!.localizedDescription)
            }
        }
        task.resume()
        //print(queryGames.count)
        //self.gameGridView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return queryGames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCollectionViewCell", for: indexPath) as! GameCollectionViewCell
        let game = queryGames[indexPath.item]
        
        cell.nameView.text = game.name
        cell.imageView.af_setImage(withURL: URL(string: game.image_url as! String)!)
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var gameView = segue.destination as! GameDetailsViewController
        let item = (sender as! IndexPath).item
        let game = queryGames[item]
        gameView.gameName = game.name
        gameView.imageLink = game.image_url
        gameView.gameDescription = "Description: " + game.description.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        print(game.description)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(queryGames[indexPath.item].name)
        performSegue(withIdentifier: "detailSegue", sender: indexPath)
        gameGridView.deselectItem(at: indexPath, animated: true)
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
