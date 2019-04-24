//
//  MenuTableViewController.swift
//  Restaurant Menu
//
//  Created by Fabiola Saga on 4/23/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

   
    
    var menuItems = [MenuItem]()
    var category: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: MenuController.menuDataUpdatedNotification, object: nil)
        updateUI()
//        title = category.capitalized
//        MenuController.shared.fetchMenuItems(forCategory: category) { (menuItems) in
//            if let menuItems = menuItems {
//                self.updateUI(with: menuItems)
//            }
//        }
    }
    
    @objc func updateUI() {
        guard let category = category else { return }
        
        title = category.capitalized
        menuItems = MenuController.shared.items(forCategory: category) ?? []
        
        tableView.reloadData()
    
    }
//    func updateUI(with menuItems: [MenuItem]) {
//
//        DispatchQueue.main.async {
//            self.menuItems = menuItems
//            self.tableView.reloadData()
//        }
//
//    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCellIdentifier", for: indexPath)
        configure(cell, forItemAt: indexPath)

        // Configure the cell...

        return cell
    }
    
    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = String(format: "$%.2f", menuItem.price)
        MenuController.shared.fetchImage(url: menuItem.imageURL) { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                if let currentIndexPath = self.tableView.indexPath(for: cell),
                    currentIndexPath != indexPath {
                    return
                }
                cell.imageView?.image = image
                cell.setNeedsLayout()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuDetailSegue" {
            let menuItemDetailViewController = segue.destination as! MenuItemDetailViewController
            let index = tableView.indexPathForSelectedRow!.row
            menuItemDetailViewController.menuItem = menuItems[index]
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        
        guard let category = category else { return }
        coder.encode(category, forKey: "category")
    }
   
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        
        category = coder.decodeObject(forKey: "category") as? String
        updateUI()
    }

   

}
