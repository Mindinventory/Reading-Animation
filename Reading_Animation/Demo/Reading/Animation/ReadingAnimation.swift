//
//  ReadingAnimation.swift
//  Kids_Animation
//
//  Created by mind-288 on 7/29/21.
//

import UIKit

extension ReadingVC {
    
    func animateViews(btnBack: UIButton, lblReading: UILabel, lblReadingDetails: UILabel, constBtnBackTop: NSLayoutConstraint, constImgReadingCenterX: NSLayoutConstraint, vcView: UIView, collReading: CollReading, readingData: [ReadingPage]) {
        
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
            
            btnBack.setAlphaValue(alpha: 1.0)
            lblReading.setAlphaValue(alpha: 1.0)
            lblReadingDetails.setAlphaValue(alpha: 1.0)
            
            constBtnBackTop.constant = 11
            
            CMainThread.asyncAfter(deadline: .now() + 0.3, execute: {
                
                self.animateImageAndCollectionView(constImgReadingCenterX: constImgReadingCenterX, vcView: vcView)
                
                collReading.readingPageData = readingData
                collReading.reloadData()
            })
            
            vcView.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    private func animateImageAndCollectionView(constImgReadingCenterX: NSLayoutConstraint, vcView: UIView) {
        
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
            
            constImgReadingCenterX.constant = 0
            
            vcView.layoutIfNeeded()
            
        }, completion: nil)
    }
}
