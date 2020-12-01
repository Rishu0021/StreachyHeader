//
//  UIView+Extension.swift
//  StreachyHeader
//
//  Created by Rishu Gupta on 01/12/20.
//

import UIKit

extension UIView {

    enum Direction {
        case vertical
        case horizontal
    }

    func showGradientColors(_ colors: [UIColor], opacity: Float = 1, direction: Direction = .vertical) {
        
        self.layer.sublayers?.forEach { (layer) in
            if layer.isKind(of: CAGradientLayer.self) {
                layer.removeFromSuperlayer()
            }
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.opacity = opacity
        gradientLayer.colors = colors.map { $0.cgColor }

        if case .horizontal = direction {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        }

        gradientLayer.bounds = self.bounds
        gradientLayer.anchorPoint = CGPoint.zero
        self.layer.addSublayer(gradientLayer)
    }

}

extension UIView {
    func addShadow(offset: CGSize = CGSize.zero, color: UIColor = .black, opacity: Float = 0.11, radius: CGFloat = 10.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }

}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

extension UIView {
    func setHideAnimation(_ hidden: Bool) {
        if self.isHidden && !hidden {
            self.alpha = 0.0
            self.isHidden = false
        }
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: {
            self.alpha = hidden ? 0.0 : 1.0
        }) { (isCompleted) in
            self.isHidden = hidden
        }
    }
}

extension UIView {
    func roundCorners(corners: CACornerMask, radius: CGFloat) {
       self.layer.cornerRadius = radius
       self.layer.maskedCorners = corners
    }
}

extension UIView {

    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        
        self.layer.add(animation, forKey: nil)
    }

}

extension UIView {
    class func initFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?[0] as! T
    }
}


extension UIView {
    func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        self.alpha = 0.0
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
            self.isHidden = false
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        self.alpha = 1.0
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
            self.alpha = 0.0
        }) { (completed) in
            self.isHidden = true
            completion(true)
        }
    }
}
