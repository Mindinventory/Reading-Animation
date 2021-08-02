//
//  HomeAnimation.swift
//  Kids_Animation
//
//  Created by mind-288 on 7/28/21.
//

import UIKit

extension HomeVC {
    
    func animateViews(stackTopBtns: UIStackView, stackLblNames: UIStackView, imgProfile: UIImageView, collHome: CollHome, constImgProfileTop: NSLayoutConstraint, conststackTopbtnsTop: NSLayoutConstraint, homeData: [HomeCollection]) {
        
        UIView.animate(withDuration: 1, delay: 0.1, options: .curveEaseInOut, animations: { [weak self] in
            
            stackTopBtns.setAlphaValue(alpha: 1.0)
            stackLblNames.setAlphaValue(alpha: 1.0)
            imgProfile.setAlphaValue(alpha: 1.0)
            collHome.setAlphaValue(alpha: 1.0)
            constImgProfileTop.constant = 8
            self?.view.layoutIfNeeded()
            
            self?.animateTopStackButtons(conststackTopbtnsTop: conststackTopbtnsTop)
            self?.animateHomeCollectionView(collHome: collHome, homeData: homeData)
            
        }, completion: nil)
    }
    
    private func animateTopStackButtons(conststackTopbtnsTop: NSLayoutConstraint) {
        
        UIView.animate(withDuration: 1, delay: 0.2, options: .curveEaseInOut, animations: { [weak self] in
            
            conststackTopbtnsTop.constant = 20.5
            self?.view.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    private func animateHomeCollectionView(collHome: CollHome, homeData: [HomeCollection]) {
        
        UIView.animate(withDuration: 1, delay: 0.2, options: .curveEaseInOut, animations: {
            
            collHome.homeData = homeData
            collHome.reloadData()
            
        }, completion: nil)
    }
}
