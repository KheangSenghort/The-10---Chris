//
//  UIViewController+Extensions.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/17/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

extension UIViewController {
    func showNetworkAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Whoops!", message: "Your network connection may be too weak to fetch movie details", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
