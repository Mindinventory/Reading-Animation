//
//  ReadingCell.swift
//  Kids_Animation
//
//  Created by mind-288 on 7/27/21.
//

import UIKit

final class ReadingCell: UICollectionViewCell {
    
    @IBOutlet weak var vwNumber: UIView!
    @IBOutlet weak var lblPage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}

//MARK:- Configure
//MARK:-
extension ReadingCell {
    
    func configureCell(page: Int) {
        
        lblPage.text = "\(page)"
        lblPage.layer.cornerRadius = 0
        lblPage.layer.masksToBounds = true
        lblPage.backgroundColor = .clear
        lblPage.textColor = .black
    }
    
    func configureSelectedCell(page: Int) {
        
        self.layoutIfNeeded()
        lblPage.text = "\(page)"
        lblPage.layer.cornerRadius = lblPage.frame.width / 2
        lblPage.layer.masksToBounds = true
        lblPage.backgroundColor = UIColor.init(red: 255/255, green: 179/255, blue: 87/255, alpha: 1.0)
        lblPage.textColor = .white
    }
}
