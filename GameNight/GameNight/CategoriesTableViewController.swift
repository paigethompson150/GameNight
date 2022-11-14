//
//  CategoriesTableViewController.swift
//  GameNight
//
//  Created by Lawrence Kwok on 11/4/22.
//

import UIKit
import Parse

class CategoriesTableViewController: UITableViewController {
    
    var categories: [String] = categoryData.displayableCategories
    var categoryId: [String] = categoryData.categoryId
    
    @IBOutlet var categoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchController = UISearchController(searchResultsController: nil)
        categoryTable.delegate = self
        categoryTable.dataSource = self
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell") as! CategoriesCell
        cell.categoryLabel.text = categories[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "categorySegue", sender: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "categorySegue") {
            var categoryNav = segue.destination as! UINavigationController
            let categoryController = categoryNav.viewControllers.first as! CategoryGridController
            let row = (sender as! IndexPath).row
            categoryController.categoryName = categories[row]
            categoryController.selectCategory = categoryId[row]
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
    // copied open source code for changing searchbar background courtesy of Alex Nadein
    // Article Link: "https://alexandernadein.medium.com/customizing-search-bar-color-1db7ceaffe5b"
    
    extension UISearchBar {
        func setTextFieldColor(_ color: UIColor) {
            for subView in self.subviews {
                for subSubView in subView.subviews {
                    let view = subSubView as? UITextInputTraits
                    if view != nil {
                        let textField = view as? UITextField
                        textField?.backgroundColor = color
                        break
                    }
                }
            }
        }
    }
    */
}

extension CategoriesTableViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        categories = categoryData.displayableCategories.filter{ categories in
            categories.starts(with: searchText)
        }
        print(categories.count)
        tableView.reloadData()
    }
}

class CategoriesCell: UITableViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
}
