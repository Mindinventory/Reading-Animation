//
//  HomeVC.swift
//  Kids_Animation
//
//  Created by mind-288 on 7/13/21.
//

import UIKit

final class HomeVC: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak private var imgProfile: UIImageView!
    @IBOutlet weak private var btnMenu: UIButton!
    @IBOutlet weak private var stackTopBtns: UIStackView!
    @IBOutlet weak private var stackLblNames: UIStackView!
    @IBOutlet weak private var btnSearch: UIButton!
    @IBOutlet weak private var lblName: UILabel!
    @IBOutlet weak private var lblHello: UILabel!
    @IBOutlet weak private var collHome: CollHome!
    @IBOutlet weak private var conststackTopbtnsTop: NSLayoutConstraint!
    @IBOutlet weak private var constImgProfileTop: NSLayoutConstraint!
    @IBOutlet weak private var constCollHomeTop: NSLayoutConstraint!
    
    //MARK: Properties
    private let homeData = [HomeCollection(image: UIImage(named: "ic_numbers") ?? UIImage(), title: "Numbers", subTitle: "(números)"),
                            HomeCollection(image: UIImage(named: "ic_book") ?? UIImage(), title: "Reading", subTitle: "(Leer)"),
                            HomeCollection(image: UIImage(named: "ic_shpaes") ?? UIImage(), title: "Shapes", subTitle: "(Formas)"),
                            HomeCollection(image: UIImage(named: "ic_abc") ?? UIImage(), title: "Vocab & Letters", subTitle: "(Vocabulario & Letras)"),
                            HomeCollection(image: UIImage(named: "ic_analysis") ?? UIImage(), title: "Learning Analysis", subTitle: "(análisis de aprendizaje)"),
                            HomeCollection(image: UIImage(named: "ic_settings") ?? UIImage(), title: "Settings", subTitle: "(Ajustes de aplicación)")]
    
    //MARK: View LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        CMainThread.asyncAfter(deadline: .now() + 0.1, execute: {
            
            self.animateViews(stackTopBtns: self.stackTopBtns, stackLblNames: self.stackLblNames, imgProfile: self.imgProfile, collHome: self.collHome, constImgProfileTop: self.constImgProfileTop, conststackTopbtnsTop: self.conststackTopbtnsTop, homeData: self.homeData)
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        collHome.resetCollectionCell()
    }
}

//MARK:- Configure
//MARK:-
extension HomeVC {
    
    private func configure() {
        
        lblHello.changeFontSize(size: CScreenWidth * (20/414), weight: .regular)
        lblName.changeFontSize(size: CScreenWidth * (30/414), weight: .black)
        
        stackLblNames.setAlphaValue(alpha: 0.2)
        imgProfile.setAlphaValue(alpha: 0.2)
        stackTopBtns.setAlphaValue(alpha: 0.2)
        
        constImgProfileTop.constant = 280
        conststackTopbtnsTop.constant = 292.5
        constCollHomeTop.constant = CScreenWidth * (167.5/414)
        
        imgProfile.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backToRootVC))
        imgProfile.addGestureRecognizer(tapGesture)
    }
    
    @objc private func backToRootVC() {
        self.navigationController?.popViewController(animated: true)
    }
}
