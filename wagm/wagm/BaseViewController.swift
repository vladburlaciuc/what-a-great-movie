//
//  BaseViewController.swift
//  What a great movie!
//
//  Created by wld on 30/01/2019.
//  Copyright © 2019 Vlad Burlaciuc. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Welcome vlad"
        let rightButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutAction))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    @objc func logoutAction(){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }



}
