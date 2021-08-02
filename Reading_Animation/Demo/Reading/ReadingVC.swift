//
//  ReadingVC.swift
//  Kids_Animation
//
//  Created by mind-288 on 7/26/21.
//

import UIKit

final class ReadingVC: UIViewController {
    
    @IBOutlet weak private var collReading: CollReading!
    @IBOutlet weak var imgRead: UIImageView!
    @IBOutlet weak private var btnBack: UIButton!
    @IBOutlet weak private var lblReadingDetails: UILabel!
    @IBOutlet weak private var lblReading: UILabel!
    @IBOutlet weak private var constBtnBackTop: NSLayoutConstraint!
    @IBOutlet weak private var constImgReadTop: NSLayoutConstraint!
    @IBOutlet weak private var constCollReadingHeight: NSLayoutConstraint!
    @IBOutlet weak private var constImgReadingCenterX: NSLayoutConstraint!
    @IBOutlet weak private var constBtnBackLeading: NSLayoutConstraint!
    @IBOutlet weak private var constCollReadingTop: NSLayoutConstraint!
    
    private var readingData = [ReadingPage(page: 1), ReadingPage(page: 2), ReadingPage(page: 3), ReadingPage(page: 4), ReadingPage(page: 5), ReadingPage(page: 6), ReadingPage(page: 7), ReadingPage(page: 8)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
}

//MARK:- Configure
//MARK:-
extension ReadingVC {
    
    private func configure() {
        
        lblReading.changeFontSize(size: CScreenWidth * (36/414), weight: .regular)
        lblReadingDetails.changeFontSize(size: CScreenWidth * (20/414), weight: .light)
        
        btnBack.setAlphaValue(alpha: 0.0)
        lblReading.setAlphaValue(alpha: 0.0)
        lblReadingDetails.setAlphaValue(alpha: 0.0)
        
        constBtnBackLeading.constant = CScreenWidth * (30/414)
        constBtnBackTop.constant = 150
        constImgReadingCenterX.constant = 400
        constCollReadingTop.constant = CScreenWidth * (678/414)
        constImgReadTop.constant = CScreenWidth * (203/414)
        constCollReadingHeight.constant = CScreenWidth * (140/414)
        
        CMainThread.asyncAfter(deadline: .now() + 0.2, execute: {
            
            self.animateViews(btnBack: self.btnBack, lblReading: self.lblReading, lblReadingDetails: self.lblReadingDetails, constBtnBackTop: self.constBtnBackTop, constImgReadingCenterX: self.constImgReadingCenterX, vcView: self.view, collReading: self.collReading, readingData: self.readingData)
        })
    }
}

//MARK:- Button's Actions
//MARK:-
extension ReadingVC {
    
    @IBAction func onBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
