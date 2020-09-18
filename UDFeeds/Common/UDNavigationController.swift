//
//  UDNavigationController.swift
//  UDFeeds
//
//  Created by Ipsi Patro on 14/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import UIKit

class UDNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let gradient = CAGradientLayer()
        var bounds = navigationBar.bounds
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        bounds.size.height += window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        gradient.frame = bounds
        gradient.colors = [UIColor.brandBlue.cgColor, UIColor.primaryBlue.cgColor]
        gradient.locations = [0,1]
        if let image = getImageFrom(gradientLayer: gradient) {
            navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        }
    }

    func getImageFrom(gradientLayer:CAGradientLayer) -> UIImage? {
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
