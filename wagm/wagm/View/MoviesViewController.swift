//
//  MoviesViewController.swift
//  What a great movie!
//
//  Created by wld on 29/01/2019.
//  Copyright © 2019 Vlad Burlaciuc. All rights reserved.
//

import UIKit

class MoviesViewController: BaseViewController {
   
    

    override func viewDidLoad() {
        Bundle.main.loadNibNamed("BaseViewController", owner: self, options: nil)
        
        super.viewDidLoad()
        endPoint = WebServiceEndpoint.getMovies.fullURL()
       
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
