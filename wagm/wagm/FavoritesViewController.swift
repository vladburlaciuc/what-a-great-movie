//
//  FavoritesViewController.swift
//  
//
//  Created by wld on 29/01/2019.
//

import UIKit

class FavoritesViewController: BaseViewController {
    
    override func viewDidLoad() {
        endPoint = String(format: WebServiceEndpoint.getFavorites.fullURL(), user.id)
        Bundle.main.loadNibNamed("BaseViewController", owner: self, options: nil)

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reloadData()
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
