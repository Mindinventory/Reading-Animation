//
//  HomeCell.swift
//  Kids_Animation
//
//  Created by mind-288 on 7/14/21.
//

import UIKit

final class HomeCell: UICollectionViewCell, CAAnimationDelegate {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak private var imgBigSmallLetters: UIImageView!
    @IBOutlet weak private var imgType: UIImageView!
    @IBOutlet weak private var lblSubTitle: UILabel!
    @IBOutlet weak private var constImgTop: NSLayoutConstraint!
    
    var isSelectedCell = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        changeLblFontSize()
        self.layer.cornerRadius = CScreenWidth * (15/414)
    }
}

//MARK:- Configure
//MARK:-
extension HomeCell {
    
    func configureCell(img: UIImage, title: String, subTitle: String) {
        
        imgType.image = img
        lblTitle.text = title
        lblSubTitle.text = subTitle
        imgType.isHidden = false
        lblTitle.isHidden = false
        lblSubTitle.isHidden = false
        imgBigSmallLetters.isHidden = true
    }
    
    func configureDidSelectCell(img: UIImage) {
        
        isSelectedCell = true
        imgBigSmallLetters.isHidden = false
        imgType.isHidden = true
        lblTitle.isHidden = true
        lblSubTitle.isHidden = true
        imgBigSmallLetters.image = img
        
        UIView.transition(with: self, duration: 0.8, options: .transitionFlipFromRight, animations: nil, completion: { [weak self] _ in
            
            self?.superview?.isUserInteractionEnabled = true
        })
    }
    
    private func changeLblFontSize() {
        
        lblTitle.changeFontSize(size: CScreenHeight * (16/896), weight: .bold)
        lblSubTitle.changeFontSize(size: CScreenHeight * (16/896), weight: .medium)
    }
}
