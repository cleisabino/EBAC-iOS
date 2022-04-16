//
//  ViewController.swift
//  TableView Primeiro App
//
//  Created by Clei Sabino Gomes De Jesus on 15/04/22.
//  Copyright © 2022 Clei Sabino Gomes De Jesus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var users = [User]()
    let service = UsersService()
    let celulaUsers = CelulaUsers()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.performRequest { (data) in
            self.users = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    private func delete(rowIndexPathAt indexPath: IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .destructive, title: "Deletar") {
            [weak self](_, _, _) in
            guard let self = self else {return}
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.endUpdates()
            self.tableView.reloadData()
        }
        
        return action
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = self.delete(rowIndexPathAt: indexPath)
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
    
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CelulaUsers", for: indexPath) as! CelulaUsers
        
        cell.avatar.setCirculoBorda(cor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), tamanhoBorda: 0.5)
        
        cell.id.text = user.id!
        cell.name.text = user.name!
        cell.createdAt.text = user.createdAt!
        if let urlAvatar = user.avatar{
            if let data = try? Data(contentsOf: URL(fileURLWithPath: urlAvatar)){
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.avatar.image = image
                    }
                }
            }else{
                cell.avatar.image = #imageLiteral(resourceName: "avatar")
            }
            
        }else{
            cell.avatar.image = #imageLiteral(resourceName: "avatar")
        }
        

        return cell
    }
}
