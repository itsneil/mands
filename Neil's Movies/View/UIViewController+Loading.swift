//
//  UIViewController+Loading.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 07/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func displaySpinner() -> UIView {
        
        let spinnerView = UIView(frame: self.view.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
        
        let spinner = UIActivityIndicatorView(style: .whiteLarge)
        spinner.startAnimating()
        spinner.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(spinner)
            self.view.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
