//
//  CollReading.swift
//  Kids_Animation
//
//  Created by mind-288 on 7/27/21.
//

import UIKit

final class CollReading: UICollectionView {
    
    var readingPageData = [ReadingPage]()
    
    private var selectedCellIndex = IndexPath(item: 0, section: 0)
    private var isSelected = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
    }
}

//MARK:- Configure
//MARK:-
extension CollReading {
    
    private func configure() {
        
        dataSource = self
        delegate = self
        register(ReadingCell.nib, forCellWithReuseIdentifier: ReadingCell.identifier)
    }
}

//MARK:- UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout Methods
//MARK:-
extension CollReading: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return readingPageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let readingCell = collectionView.dequeueReusableCell(withReuseIdentifier: ReadingCell.identifier, for: indexPath) as? ReadingCell {
            
            if selectedCellIndex.item == indexPath.item {
                readingCell.configureSelectedCell(page: readingPageData[indexPath.row].page)
            } else {
                readingCell.configureCell(page: readingPageData[indexPath.row].page)
            }
            return readingCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if !isSelected {
            
            cell.transform = CGAffineTransform(translationX: 0, y: 300)
            
            UIView.animate(withDuration: 0.8, delay: 0, animations: { [weak self] in
                
                if let readingCell = cell as? ReadingCell {
                    
                    readingCell.transform = CGAffineTransform(translationX: 0, y: 0)
                    self?.layoutIfNeeded()
                }
                
            }, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        isSelected = true
        selectedCellIndex = indexPath
        
        if let readingCell = self.cellForItem(at: indexPath) as? ReadingCell {
            
            readingCell.configureSelectedCell(page: readingPageData[indexPath.row].page)
            self.reloadData()
            
            self.isUserInteractionEnabled = false
            
            if indexPath.row % 2 == 0 {
                animateImageChange(image: UIImage(named: "ic_Read") ?? UIImage())
            } else {
                animateImageChange(image: UIImage(named: "ic_Reading") ?? UIImage())
            }
        }
    }
    
    //MARK: CollectionView FlowLayout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if selectedCellIndex.item == indexPath.item {
            
            let size = (CScreenWidth * (50/414))
            return CGSize(width: size, height: size)
            
        } else {
            
            let size = (CScreenWidth / 8) - 20
            return CGSize(width: size, height: size)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 14.35
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 20, left: 11, bottom: 70, right: 30)
    }
}

//MARK:- Animation Methods for Changing Image
//MARK:-
extension CollReading {
    
    private func animateImageChange(image: UIImage) {
        
        if let readingVC = UIApplication.topViewController() as? ReadingVC {
            
            UIView.transition(with: readingVC.imgRead, duration: 1, options: .transitionCurlUp, animations: {
                
                readingVC.imgRead.image = image
                
            }, completion: { [weak self] _ in
                
                self?.isUserInteractionEnabled = true
            })
        }
    }
}
