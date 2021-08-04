//
//  LoginAnimation.swift
//  Kids_Animation
//
//  Created by mind-288 on 7/28/21.
//

import UIKit

extension LoginVC {

    func animate(imgKidszooLogo: UIImageView, stackLogin: UIStackView) {

        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
            guard let `self` = self else { return }
            self.animateViews(imgKidszooLogo: imgKidszooLogo, stackLogin: stackLogin)
            imgKidszooLogo.center.y = isNotch ? 105 : 70
        }, completion: nil)
    }

    func animateViews(imgKidszooLogo: UIImageView, stackLogin: UIStackView) {

        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
            imgKidszooLogo.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        }, completion: { [weak self] _ in
            guard let `self` = self else { return }
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
                guard let `self` = self else { return }
                self.setConstraintAccordingtoScreen()

                stackLogin.setAlphaValue(alpha: 1.0)
                self.view.layoutIfNeeded()
            }, completion: nil)
        })
    }
}
