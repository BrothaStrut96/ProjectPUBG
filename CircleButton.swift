//
//  CircleButton.swift
//  
//
//  Created by Ruaridh Wylie on 01/10/2017.
//

import UIKit

class CircleButton: UIButton {

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
