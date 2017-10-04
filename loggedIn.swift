//
//  loggedIn.swift
//  ProjectPUBG
//
//  Created by Ruaridh Wylie on 02/10/2017.
//  Copyright © 2017 Ruaridh Wylie. All rights reserved.
//

import Foundation
import Firebase


class loggedIn: UIViewController {
    
    @IBOutlet var userName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //check authentication
        
        print("Hello Logged in")
        
        let usernameDisplay = Auth.auth().currentUser?.displayName
        
        userName.text = usernameDisplay
        
            
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
       
    
    }
    
    
    @IBAction func signOut(_ sender: Any) {
        
        logout()
    }
    
    func logout() {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("Logged out")
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Intro") as! ViewController
            self.present(nextViewController, animated:true, completion:nil)
            
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }

}
