//
//  Xia.swift
//  Xia
//
//  Created by Leo on 27/02/2017.
//
//  Copyright (c) 2017 Leo <leodaxia@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.


import UIKit
import SnapKit

public enum XiaType {
    case Info
    case Success
    case Warning
}

open class Xia: UIView {
    
    static let xiaBundlePath: String = Bundle(for: Xia.self).path(forResource: "Xia", ofType: "bundle")!
    static let infoImagePath: String = xiaBundlePath.xiaStringByAppendingPathComponent("XiaIconInfo@2x.png")
    static let succImagePath: String = xiaBundlePath.xiaStringByAppendingPathComponent("XiaIconSuccess@2x.png")
    static let warnImagePath: String = xiaBundlePath.xiaStringByAppendingPathComponent("XiaIconWarning@2x.png")
    open static let infoImage: UIImage = UIImage(contentsOfFile: infoImagePath)!
    open static let succImage: UIImage = UIImage(contentsOfFile: succImagePath)!
    open static let warnImage: UIImage = UIImage(contentsOfFile: warnImagePath)!
    
    open var autoHide = true {
        didSet {
            self.timer?.invalidate()
            self.timer = nil
        }
    }
    open var delay = 3.0
    
    open var textColor = UIColor.black {
        didSet {
            self.textLabel.textColor = textColor
        }
    }
    open var textFont  = UIFont.systemFont(ofSize: 15.0) {
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
        super.init(coder: aDecoder)
        
        setupMainView()
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
        
        let swipeGR = UISwipeGestureRecognizer(
            target: self,
            action: #selector(onSwipe)
        )
        swipeGR.direction = .up
        self.addGestureRecognizer(swipeGR)
    }
    
    @objc
    private func onSwipe() {
        self.hide()
        
        self.timer?.invalidate()
        self.timer = nil
    }
    
    @discardableResult
    public class func show(type: XiaType, text: String?, textColor: UIColor = .black, backgroundColor: UIColor = .white) -> Xia {
        return Xia().show(type: type, text: text, textColor: textColor, backgroundColor: backgroundColor)
    }
    
    @discardableResult
    public class func showInfo(_ text: String?, textColor: UIColor = .black, backgroundColor: UIColor = .white) -> Xia {
        return self.show(type: .Info, text: text, textColor: textColor, backgroundColor: backgroundColor)
    }
    
    @discardableResult
    public class func showSuccess(_ text: String?, textColor: UIColor = .black, backgroundColor: UIColor = .white) -> Xia {
        return self.show(type: .Success, text: text, textColor: textColor, backgroundColor: backgroundColor)
    }
    
    @discardableResult
    public class func showWarning(_ text: String?, textColor: UIColor = .white, backgroundColor: UIColor = .orange) -> Xia {
        return self.show(type: .Warning, text: text, textColor: textColor, backgroundColor: backgroundColor)
    }
    
    @discardableResult
    public func show(type: XiaType, text: String?, textColor: UIColor = .black, backgroundColor: UIColor = .white) -> Xia {
        switch type {
        case .Info:
            self.iconView.image = Xia.infoImage
        case .Success:
            self.iconView.image = Xia.succImage
        case .Warning:
            self.iconView.image = Xia.warnImage
        }
        
        self.textLabel.text = text
        self.textColor = textColor
        
        self.backgroundColor = backgroundColor;
        
        return self.show()
    }
    
    @discardableResult
    public func showInfo(_ text: String?, textColor: UIColor = .black, backgroundColor: UIColor = .white) -> Xia {
        return self.show(type: .Info, text: text, textColor: textColor, backgroundColor: backgroundColor)
    }
    
    @discardableResult
    public func showSuccess(_ text: String?, textColor: UIColor = .black, backgroundColor: UIColor = .white) -> Xia {
        return self.show(type: .Success, text: text, textColor: textColor, backgroundColor: backgroundColor)
    }
    
    @discardableResult
    public func showWarning(_ text: String?, textColor: UIColor = .white, backgroundColor: UIColor = .orange) -> Xia {
        return self.show(type: .Warning, text: text, textColor: textColor, backgroundColor: backgroundColor)
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
                self.timer = Timer.scheduledTimer(timeInterval: self.delay, target: self, selector: #selector(hideFromTimer), userInfo: nil, repeats: false)
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
