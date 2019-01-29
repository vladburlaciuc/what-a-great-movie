//
//  loginViewController.swift
//  wagm
//
//  Created by wld on 28/01/2019.
//  Copyright © 2019 Vlad Burlaciuc. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginNow(_ sender: Any) {
        //validate user name to contain only numbers, letters and underscore.
        if userName.text!.isValidUserName {
            
            UserService().getUser(userName: userName.text!) {[weak self] result in
                guard self != nil else { return }
                
                if let success = result["success"] as? Int{
                    switch success{
                    case 0:
                        let alertController = UIAlertController(title: "Error", message:
                            result["error"] as? String, preferredStyle: UIAlertController.Style.alert)
                        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,handler: nil))
                        self?.present(alertController, animated: true, completion: nil)
                        break
                    case 1:
                        
                        break
                    case 2:
                        let alertController = UIAlertController(title: nil, message:
                            "Do you want to create a new user with username: \(self?.userName.text! ?? "")?", preferredStyle: UIAlertController.Style.alert)
                        
                        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { alertAction in
                            if let userName = self?.userName.text!{
                                UserService().setUser(userName: userName, completionHandler: { [weak self] result in
                                    guard self != nil else { return }
                                    
                                })
                            }
                        }))
                        
                        alertController.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default,handler: nil))
                        
                        self?.present(alertController, animated: true, completion: nil)
                        
                        break
                    default:
                        break
                    }
                }
            }
            
            
            
        }else{
            
            let alertController = UIAlertController(title: "Error", message:
                "Please only introduce numbers, letters and underscore.", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            
        }
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


