//
//  CircleTextFeild.swift
//  ProjectPUBG
//
//  Created by Ruaridh Wylie on 01/10/2017.
//  Copyright © 2017 Ruaridh Wylie. All rights reserved.
//

import UIKit

class CircleTextFeild: UITextField {
        
        @IBInspectable var cornerRadius: CGFloat = 30.0 {
            
            didSet{
                
                layer.cornerRadius = cornerRadius
                
                
                
            }
        }
        
        override func prepareForInterfaceBuilder() {
            
            setupVeiw()
            
            
            
        }
        
        func setupVeiw(){
            
            layer.cornerRadius = cornerRadius
        }

}
