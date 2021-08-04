//
//  Extensions.swift
//  Kids_Animation
//
//  Created by mind-288 on 7/13/21.
//

import UIKit

// MARK: - UIStoryboard -
protocol IdentifierType {
    associatedtype Identifier: RawRepresentable
}

extension UIStoryboard: IdentifierType {

    enum Identifier: String {

        case homeVC = "HomeVC"
        case lettersVC = "LettersVC"
        case numbersVC = "NumbersVC"
        case readingVC = "ReadingVC"
    }

    func instantiateViewControllerWithIdentifier(identifier: Identifier) -> UIViewController {
        return self.instantiateViewController(withIdentifier: identifier.rawValue)
    }
}

// MARK: - UICollectionViewCells' Nib and Identifier. -
extension UICollectionViewCell {

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    static var identifier: String {
        return String(describing: self)
    }
}

// MARK: - UIView -
extension UIView {

    func setAlphaValue(alpha: CGFloat) {
        self.alpha = alpha
    }

    func roundedCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
}

// MARK: - UILabel -
extension UILabel {

    // Change Label's Font size.
    func changeFontSize(size: CGFloat, weight: UIFont.Weight) {
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
    }
}

// MARK: - UILabel -
extension UITextField {

    func configureTxtField(cornRadius: CGFloat, placeHolder: String, leftSpacing: CGFloat, placeholderColor: UIColor) {

        self.roundedCorners(radius: (CScreenWidth * (cornRadius/414)))
        self.layer.masksToBounds = true
        self.attributedPlaceholder = NSAttributedString(string: placeHolder,
                                                        attributes: [.foregroundColor: placeholderColor])
        self.font = UIFont.systemFont(ofSize: CScreenWidth * (16/414), weight: .semibold)
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: leftSpacing, height: self.frame.height))
        self.leftViewMode = .always
    }
}

// MARK: - UIButton -
extension UIButton {

    func changeFontSize(size: CGFloat, weight: UIFont.Weight) {
        self.titleLabel?.font = UIFont.systemFont(ofSize: size, weight: weight)
    }
}

// MARK: - Extension for Getting Top View Controller -
extension UIApplication {

    class func topViewController(controller: UIViewController? = rootVC) -> UIViewController? {

        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }

        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }

        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}

// MARK: - UIDevice -
extension UIDevice {

    // Check If iPhone has Notch
    var hasNotch: Bool {
        if #available(iOS 11.0, *) {
            if UIApplication.shared.windows.count == 0 { return false }
            let top = UIApplication.shared.windows[0].safeAreaInsets.top
            return top > 20
        } else {
            return false
        }
    }
}
