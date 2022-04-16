//
//  ImageView.swift
//  TableView Primeiro App
//
//  Created by Clei Sabino Gomes De Jesus on 15/04/22.
//  Copyright © 2022 Clei Sabino Gomes De Jesus. All rights reserved.
//

import UIKit

extension UIImageView{
    
    func setCirculo(){
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
    func setCirculoBorda(cor: UIColor, tamanhoBorda: CGFloat){
        self.layer.borderWidth = tamanhoBorda
        self.layer.borderColor =  cor.cgColor
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}
