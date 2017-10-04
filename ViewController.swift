//
//  ViewController.swift
//  ProjectPUBG
//
//  Created by Ruaridh Wylie on 01/10/2017.
//  Copyright © 2017 Ruaridh Wylie. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var Email: CircleTextFeild!
    
    @IBOutlet weak var Password: CircleTextFeild!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       //check authentication
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if Auth.auth().currentUser != nil {
            
            print("Signed in")
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Login") as! loggedIn
            self.present(nextViewController, animated:true, completion:nil)
            
            print("done")
            
            
        } else {
            
            print("Sign In")
            
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func loginAct(_ sender: Any) {
        
            Auth.auth().signIn(withEmail: Email.text!, password: Password.text!) {
                (user, error) in
                
                if error != nil {
                    
                    //Error
                    
                    print("Wrong Creds")
                    
                } else {
                    
                    //no error
                    
                    print("Loggin in")
                    
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Login") as! loggedIn
                    self.present(nextViewController, animated:true, completion:nil)
                    
                }
            }
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Account Creation") as! accountCreation
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    @IBAction func ForgotPassword(_ sender: Any) {
        
        Auth.auth().sendPasswordReset(withEmail: Email.text!) {
            (error) in
            
            if error != nil || self.Email.text == nil {
                
                //error
                
                print("Not Sent" + " \(String(describing: error))")
                
            } else {
                
                // no error
                
                print("No Error")
        }
        
    }
    
}
    
    }



