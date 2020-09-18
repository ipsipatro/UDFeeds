//
//  BlueButton.swift
//  UDFeeds
//
//  Created by Ipsi Patro on 14/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import Foundation

import UIKit

class BlueButton: UIButton {
    
    @IBInspectable var primaryColor: CGColor? {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var secondaryColor : CGColor? {
        didSet {
            setup()
        }
    }
    
    override public class var layerClass: Swift.AnyClass {
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        setTitleColor(UIColor.white, for: .normal)
        setTitleColor(UIColor.white, for: .selected)
        setTitleShadowColor(UIColor.black.withAlphaComponent(0.5), for: .normal)
        setTitleShadowColor(UIColor.black.withAlphaComponent(0.5), for: .selected)
        
        titleLabel?.shadowOffset = CGSize(width: 0, height: 1)
        titleLabel?.layer.shadowRadius = 4
        
        clipsToBounds = true
        
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        layer.cornerRadius = 4
        layer.masksToBounds = false
        
        guard let gradientLayer = self.layer as? CAGradientLayer else { return }
        gradientLayer.colors = [primaryColor ?? UIColor.brandBlue.cgColor, secondaryColor ?? UIColor.primaryBlue.cgColor]
        gradientLayer.locations = [0,1]
        gradientLayer.frame = self.bounds
    }
}
