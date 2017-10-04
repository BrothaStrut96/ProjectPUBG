//
//  accountCreation.swift
//  ProjectPUBG
//
//  Created by Ruaridh Wylie on 02/10/2017.
//  Copyright © 2017 Ruaridh Wylie. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class accountCreation: UIViewController {
    
    
    @IBOutlet weak var Email: CircleTextFeild!
    
    @IBOutlet weak var Username: CircleTextFeild!
    
    @IBOutlet weak var Password: CircleTextFeild!
    
    
    override func viewDidLoad() {
        
        //do some loading
    }
    
    override func didReceiveMemoryWarning() {
        
        // remove things that can be re-created
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func AcCr(_ sender: Any) {
        
            Auth.auth().createUser(withEmail: Email.text!, password: Password.text!) {
                (user, error) in
                
                if error != nil {
                    
                //Error
                    
                print("error")
                    
                } else {
                    
                //No Error
                    
                print("No error")
                    
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = self.Username.text
                changeRequest?.commitChanges {
                    
                (error) in
                        
                if error != nil {
                            
                print("error")
                            
                } else {
                            
                print("Worked")
                            
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Login") as! loggedIn
                self.present(nextViewController, animated:true, completion:nil)
                    
                    }
                }
            }
        }
    }
}
