//
//  ViewController.swift
//  Kids_Animation
//
//  Created by mind-288 on 7/9/21.
//

import UIKit

final class LoginVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak private var txtPassword: UITextField!
    @IBOutlet weak private var txtUserName: UITextField!
    @IBOutlet weak private var imgKidszooLogo: UIImageView!
    @IBOutlet weak private var stackLogin: UIStackView!
    @IBOutlet weak private var btnForgotPassword: UIButton!
    @IBOutlet weak private var btnGo: UIButton!
    @IBOutlet weak private var lblDontAccount: UILabel!
    @IBOutlet weak private var btnSignUp: UIButton!
    @IBOutlet weak private var constStackVwHeight: NSLayoutConstraint!
    @IBOutlet weak private var constStackViewTop: NSLayoutConstraint!
    @IBOutlet weak private var constImgDinosaurBottom: NSLayoutConstraint!
    @IBOutlet weak private var constImgDinosaurHeight: NSLayoutConstraint!

    // MARK: - View LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - Configure -
extension LoginVC {

    private func configure() {

        navigationController?.navigationBar.isHidden = true

        imgKidszooLogo.frame = CGRect(x: 0, y: 0, width: CScreenWidth * (176/414), height: CScreenWidth * (78/414))
        imgKidszooLogo.center.x = view.center.x
        imgKidszooLogo.center.y = view.center.y

        constImgDinosaurHeight.constant = CScreenHeight * (340/896)

        stackLogin.setAlphaValue(alpha: 0.0)

        btnGo.roundedCorners(radius: (CScreenWidth * (25/414)))

        txtUserName.configureTxtField(cornRadius: 25, placeHolder: "Username",
                                      leftSpacing: 30, placeholderColor: UIColor.init(red: 139/255,
                                                                                      green: 139/255,
                                                                                      blue: 139/255, alpha: 1.0))
        txtPassword.configureTxtField(cornRadius: 25, placeHolder: "Password",
                                      leftSpacing: 30, placeholderColor: UIColor.init(red: 139/255,
                                                                                      green: 139/255,
                                                                                      blue: 139/255, alpha: 1.0))

        lblDontAccount.changeFontSize(size: (CScreenWidth * (16/414)), weight: .bold)
        btnGo.changeFontSize(size: (CScreenWidth * (24/414)), weight: .heavy)
        btnForgotPassword.changeFontSize(size: (CScreenWidth * (16/414)), weight: .semibold)
        btnSignUp.changeFontSize(size: (CScreenWidth * (16/414)), weight: .bold)

        animate(imgKidszooLogo: imgKidszooLogo, stackLogin: stackLogin)
    }

    func setConstraintAccordingtoScreen() {

        constImgDinosaurBottom.constant = isNotch ? -16 : 0
        constStackViewTop.constant = CScreenWidth * (140/414)
        constStackVwHeight.constant = CScreenWidth * (300/414)
    }
}

// MARK: - Button's Actions -
extension LoginVC {

    @IBAction private func onBtnGo(_ sender: UIButton) {
        let homeVC = CMainStoryboard.instantiateViewControllerWithIdentifier(identifier: .homeVC)
        navigationController?.pushViewController(homeVC, animated: true)
    }
}
