//
//  ReadingAnimation.swift
//  Kids_Animation
//
//  Created by mind-288 on 7/29/21.
//

import UIKit

extension ReadingVC {

    func animateViews(btnBack: UIButton, lbls: (lblReading: UILabel, lblReadingDetails: UILabel),
                      constraint: (btnBackTop: NSLayoutConstraint, imgReadingCenterX: NSLayoutConstraint),
                      vcView: UIView, coll: (collReading: CollReading, readingData: [ReadingPage])) {

        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {

            btnBack.setAlphaValue(alpha: 1.0)
            lbls.lblReading.setAlphaValue(alpha: 1.0)
            lbls.lblReadingDetails.setAlphaValue(alpha: 1.0)
            constraint.btnBackTop.constant = 11

            CMainThread.asyncAfter(deadline: .now() + 0.3, execute: {

                self.animateImageAndCollectionView(constImgReadingCenterX: constraint.imgReadingCenterX, vcView: vcView)
                coll.collReading.readingPageData = coll.readingData
                coll.collReading.reloadData()
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
