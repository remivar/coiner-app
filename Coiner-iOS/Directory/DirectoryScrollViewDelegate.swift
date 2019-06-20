//
//  DirectoryScrollViewDelegate.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/20/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation
import UIKit

extension DirectoryViewController: UIScrollViewDelegate {

    func configureDrawerComponents() {
        checkForCurrentUser()
        switch isCurrentlyLoggedIn {
        case false:
            currentUserView.isHidden = true
            transactionsStackView.isHidden = true
            rewardsStackView.isHidden = true
            walletStackView.isHidden = true
            logOut_signInButton.setTitle("Log In/Sign Up", for: .normal)
            logOut_signInButton.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        case true:
            currentUserView.isHidden = false
            transactionsStackView.isHidden = false
            rewardsStackView.isHidden = false
            walletStackView.isHidden = false
            logOut_signInButton.setTitle("Log Out", for: .normal)
            logOut_signInButton.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
    }
    
    func setUpDrawerScrollView() {
        drawerScrollView.contentOffset = CGPoint(x: self.view.frame.width * 0.75, y: 0)
        drawerScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: self.view.frame.width * 0.75)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.tag == 1 {
            let initialOffset = self.view.bounds.width * 0.75
            let percentMoved = ((initialOffset - scrollView.contentOffset.x) / initialOffset)
            self.dimView.alpha = 0.6 * percentMoved
        } else if scrollView.tag == 2 {
            let initialOffset = self.view.bounds.height
        }
    }
}
