//
//  Xia.swift
//  Xia
//
//  Created by Leo on 27/02/2017.
//  Copyright © 2017 Leo. All rights reserved.
//
//  Xia
//  https://github.com/iTofu/Xia
//  V 0.0.2
//

import UIKit
import SnapKit

open class Xia: UIView {
    static let xiaBundlePath: String! = Bundle(for: Xia.self).path(forResource: "Xia", ofType: "bundle")
    static let infoImagePath: String! = xiaBundlePath.xiaStringByAppendingPathComponent("XiaIconInfo@2x.png")
    static let succImagePath: String! = xiaBundlePath.xiaStringByAppendingPathComponent("XiaIconSuccess@2x.png")
    static let warnImagePath: String! = xiaBundlePath.xiaStringByAppendingPathComponent("XiaIconWarning@2x.png")
    static let infoImage: UIImage!    = UIImage.init(contentsOfFile: infoImagePath)
    static let succImage: UIImage!    = UIImage.init(contentsOfFile: succImagePath)
    static let warnImage: UIImage!    = UIImage.init(contentsOfFile: warnImagePath)
    
    public enum XiaType {
        case Info
        case Success
        case Warning
    }
    
    public var autoHide = true {
        didSet {
            self.timer?.invalidate()
        }
    }
    public var delay = 3.0
    
    public var textColor = UIColor.black {
        didSet {
            self.textLabel.textColor = textColor
        }
    }
    public var textFont  = UIFont.systemFont(ofSize: 15.0) {
        didSet {
            self.textLabel.font = textFont
        }
    }
    
    fileprivate let iconView  = UIImageView()
    fileprivate let textLabel = UILabel()
    
    private var timer: Timer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupMainView()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupMainView() {
        self.backgroundColor = UIColor.white
        
        let container = UIView()
        self.addSubview(container)
        container.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(1.0)
            make.height.equalTo(44.0)
        }
        
        container.addSubview(self.iconView)
        iconView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10.0)
            make.size.equalTo(CGSize(width: 20.0, height: 20.0))
        }
        
        self.textLabel.textColor = self.textColor
        self.textLabel.font = self.textFont
        self.textLabel.adjustsFontSizeToFitWidth = true
        container.addSubview(self.textLabel)
        textLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(8.0)
            make.right.equalToSuperview().offset(-10.0)
            make.top.bottom.equalToSuperview()
        }
    }
    
    @discardableResult
    public class func show(type: XiaType, text: String?, backgroundColor: UIColor = UIColor.white) -> Xia {
        return Xia().show(type: type, text: text, backgroundColor: backgroundColor)
    }
    
    @discardableResult
    public class func showInfo(_ text: String?, backgroundColor: UIColor = UIColor.white) -> Xia {
        return self.show(type: .Info, text: text, backgroundColor: backgroundColor)
    }
    
    @discardableResult
    public class func showSuccess(_ text: String?, backgroundColor: UIColor = UIColor.white) -> Xia {
        return self.show(type: .Success, text: text, backgroundColor: backgroundColor)
    }
    
    @discardableResult
    public class func showWarning(_ text: String?, backgroundColor: UIColor = UIColor.white) -> Xia {
        return self.show(type: .Warning, text: text, backgroundColor: backgroundColor)
    }
    
    @discardableResult
    public func show(type: XiaType, text: String?, backgroundColor: UIColor = UIColor.white) -> Xia {
        switch type {
        case .Info:
            self.iconView.image = Xia.infoImage
        case .Success:
            self.iconView.image = Xia.succImage
        case .Warning:
            self.iconView.image = Xia.warnImage
        }
        
        self.textLabel.text = text
        
        self.backgroundColor = backgroundColor;
        
        return self.show()
    }
    
    @discardableResult
    public func showInfo(_ text: String?, backgroundColor: UIColor = UIColor.white) -> Xia {
        return self.show(type: .Info, text: text, backgroundColor: backgroundColor)
    }
    
    @discardableResult
    public func showSuccess(_ text: String?, backgroundColor: UIColor = UIColor.white) -> Xia {
        return self.show(type: .Success, text: text, backgroundColor: backgroundColor)
    }
    
    @discardableResult
    public func showWarning(_ text: String?, backgroundColor: UIColor = UIColor.white) -> Xia {
        return self.show(type: .Warning, text: text, backgroundColor: backgroundColor)
    }
    
    @discardableResult
    public func show() -> Xia {
        if let keyWindow = UIApplication.shared.keyWindow {
            self.xiaInstallShadow()
            
            keyWindow.addSubview(self)
            self.snp.makeConstraints({ (make) in
                make.left.right.equalToSuperview()
                make.height.equalTo(100.0)
                make.bottom.equalTo(keyWindow.snp.top)
            })
            
            keyWindow.layoutIfNeeded()
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .allowUserInteraction, animations: {
                self.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(keyWindow.snp.top).offset(65.0)
                })
                keyWindow.layoutIfNeeded()
            }, completion: nil)
            
            if self.autoHide {
                self.timer = Timer.scheduledTimer(timeInterval: self.delay, target: self, selector: #selector(self.hideFromTimer), userInfo: nil, repeats: false)
                RunLoop.main.add(self.timer!, forMode: RunLoopMode.commonModes)
            }
        } else {
            print("Warning: No keyWindow!")
        }
        
        return self
    }
    
    @objc
    private func hideFromTimer() {
        self.hide()
    }
    
    public func hide(completion: (() -> Void)? = nil) {
        if let keyWindow = self.superview {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .allowUserInteraction, animations: {
                self.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(keyWindow.snp.top)
                })
                keyWindow.layoutIfNeeded()
            }, completion: { (finished) in
                self.removeFromSuperview()
                
                completion?()
            })
        }
    }
}

extension String {
    
    func xiaStringByAppendingPathComponent(_ path: String) -> String {
        let nsSt = self as NSString
        return nsSt.appendingPathComponent(path)
    }
}

extension UIView {
    func xiaInstallShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 2.0
    }
}
