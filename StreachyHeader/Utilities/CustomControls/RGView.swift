//
//  RGView.swift
//  StreachyHeader
//
//  Created by Rishu Gupta on 01/12/20.
//

import Foundation

import UIKit

//MARK:- View with Customizable corners

@IBDesignable
class RGCornerView: UIView {
    
    //MARK:- Corner Layer Properties
    private var enabledCorners = CACornerMask()
    
    @IBInspectable
    public var bezelArcSize: CGFloat = 7.0 {
        didSet {
            updateCorners()
        }
    }
    
    @IBInspectable
    public var topLeftBezel: Bool = false {
        didSet {
            topLeftBezel ? addCorner(corner: .layerMinXMinYCorner) : removeCorner(corner: .layerMinXMinYCorner)
        }
    }
    
    @IBInspectable
    public var topRightBezel: Bool = true {
        didSet {
            topRightBezel ? addCorner(corner: .layerMaxXMinYCorner) : removeCorner(corner: .layerMaxXMinYCorner)
        }
    }
    
    @IBInspectable
    public var bottomLeftBezel: Bool = true {
        didSet {
            bottomLeftBezel ? addCorner(corner: .layerMinXMaxYCorner) : removeCorner(corner: .layerMinXMaxYCorner)
        }
    }
    
    @IBInspectable
    public var bottomRightBezel: Bool = false {
        didSet {
            bottomRightBezel ? addCorner(corner: .layerMaxXMaxYCorner) : removeCorner(corner: .layerMaxXMaxYCorner)
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat = 1.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }

    @IBInspectable
    public var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    public var showShadow: Bool = false {
        didSet {
            self.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .black, opacity: 0.11, radius: 4.0)
        }
    }
    
        
    override func awakeFromNib() {
        // Setup Bottom-Border
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    public func commonInit() {        
        self.updateCorners()
    }
    
    
    // Setup Corner layer
    private func addCorner(corner: CACornerMask) {
        enabledCorners.formUnion(corner)
        updateCorners()
    }
    
    private func removeCorner(corner: CACornerMask) {
        enabledCorners.subtract(corner)
        updateCorners()
    }
    
    private func updateCorners() {
        self.layer.cornerRadius = bezelArcSize
        self.layer.maskedCorners = enabledCorners
        self.setNeedsDisplay()
    }
    
    override var bounds: CGRect {
        didSet {
            updateCorners()
        }
    }
    
}



//MARK:- View with Gradient Background

@IBDesignable
class RGGradientView: UIView {
    
    @IBInspectable var startColor: UIColor = #colorLiteral(red: 0.9350000024, green: 0.2419999987, blue: 0.3529999852, alpha: 1) {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endColor: UIColor = #colorLiteral(red: 0.9499999881, green: 0.425999999, blue: 0.1340000033, alpha: 1) {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowX: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowY: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowBlur: CGFloat = 3 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var startPointX: CGFloat = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var startPointY: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endPointX: CGFloat = 1.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endPointY: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        self.setGradientBackground()
    }
    
    func setGradientBackground(opacity: Float = 1, direction: Direction = .horizontal) {
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.opacity = opacity
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        if case .horizontal = direction {
            gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
            gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
        }
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowX, height: shadowY)
        layer.shadowRadius = shadowBlur
        layer.shadowOpacity = 1
    }
}

@IBDesignable
class RGVerticalGradientView: UIView {
    
    @IBInspectable var startColor: UIColor = #colorLiteral(red: 0.9350000024, green: 0.2419999987, blue: 0.3529999852, alpha: 1) {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endColor: UIColor = #colorLiteral(red: 0.9499999881, green: 0.425999999, blue: 0.1340000033, alpha: 1) {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowX: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowY: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowBlur: CGFloat = 3 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var startPointX: CGFloat = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var startPointY: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endPointX: CGFloat = 1.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endPointY: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        self.setGradientBackground()
    }
    
    func setGradientBackground(opacity: Float = 1, direction: Direction = .vertical) {
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.opacity = opacity
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        if case .horizontal = direction {
            gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
            gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
        }
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowX, height: shadowY)
        layer.shadowRadius = shadowBlur
        layer.shadowOpacity = 1
    }
}
