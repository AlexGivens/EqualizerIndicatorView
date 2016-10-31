//
//  EqualizerIndicatorView.swift
//
//  Copyright (c) 2016 Alex Givens (http://alexgivens.com/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

@IBDesignable
public class EqualizerIndicatorView: UIView {
    
    public enum state {
        case play
        case pause
        case stop
    }
    
    public private(set) var state: state = .stop
    
    private var bars = [EqualizerBar]()
    
    @IBInspectable
    public var barCount: Int = 3 {
        didSet {
            generateBars()
        }
    }
    
    @IBInspectable
    public var barSpacing: CGFloat = 1.0 {
        didSet {
            generateBars()
        }
    }
    
    public override var tintColor: UIColor! {
        didSet {
            generateBars()
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        registerForAppStateNotifications()
        generateBars()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        registerForAppStateNotifications()
        generateBars()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: .UIApplicationWillEnterForeground,
                                                  object: nil)
    }
    
    public func setState(_ state: state, animated: Bool) {
        if self.state == state {
            return
        }
        self.state = state
        for bar in bars {
            bar.setState(self.state, animated: animated)
        }
    }
    
    private func registerForAppStateNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(applicationWillEnterForeground),
                                               name: .UIApplicationWillEnterForeground,
                                               object: nil)
    }
    
    func applicationWillEnterForeground() {
        for bar in bars {
            bar.setState(self.state, animated: false)
        }
    }
    
    private func generateBars() {
        
        for bar in bars {
            bar.removeFromSuperview()
        }
        
        bars = [EqualizerBar]()
        
        if barCount <= 0 {
            return
        }
        
        layoutIfNeeded()
        
        let totalSpacing = barSpacing * (CGFloat(barCount) - 1)
        let barWidth = (bounds.size.width - totalSpacing) / CGFloat(barCount)
        
        for index in 0..<barCount {
            let xCoordinate = (CGFloat(index) * barWidth) + (CGFloat(index) * barSpacing)
            let frame = CGRect(x: xCoordinate, y: 0, width: barWidth, height: bounds.size.height)
            let bar = EqualizerBar(frame: frame, tintColor: tintColor)
            addSubview(bar)
            bars.append(bar)
        }
        
        let oneEighty = CGFloat(M_PI_2) * 2.0
        transform = CGAffineTransform(rotationAngle: oneEighty)
    }
    
    private class EqualizerBar: UIView {
        
        private var animationDuration: TimeInterval = randomDoubleBetween(0.9, 1.3)
        private var animationDelay: TimeInterval = randomDoubleBetween(0.0, 0.2)
        private var imageView: UIImageView!
        private var pauseHeight: CGFloat!
        private var state: state = .stop
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            initialize()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            initialize()
        }
        
        init(frame: CGRect, tintColor: UIColor) {
            super.init(frame: frame)
            self.tintColor = tintColor
            initialize()
        }
        
        private func initialize() {
            pauseHeight = bounds.size.height * 0.3
            
            let size = CGSize(width: 1, height: 1)
            UIGraphicsBeginImageContext(size)
            let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            tintColor.setFill()
            path.fill()
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: 0))
            imageView.image = image
            
            addSubview(imageView)
        }
        
        func setState(_ state: state, animated: Bool) {
            resetAnimations()
            self.state = state
            switch state {
            case .play:
                playAnimated(animated: animated)
            case .pause:
                pauseAnimated(animated: animated)
            case .stop:
                stopAnimated(animated: animated)
            }
        }
        
        private func playAnimated(animated: Bool) {
            UIView.animateKeyframes(
                withDuration: animationDuration,
                delay: animationDelay,
                options: [],
                animations: {
                    UIView.addKeyframe(
                        withRelativeStartTime: 0.0,
                        relativeDuration: 0.5,
                        animations: {
                            self.setImageViewHeight(height: self.bounds.size.height)
                        }
                    )
                    UIView.addKeyframe(
                        withRelativeStartTime: 0.5,
                        relativeDuration: 0.5,
                        animations: {
                            self.setImageViewHeight(height: self.pauseHeight)
                        }
                    )
                },
                completion: { finished in
                    if self.state == .play {
                        UIView.animateKeyframes(
                            withDuration: self.animationDuration,
                            delay: self.animationDelay,
                            options: [.autoreverse, .repeat],
                            animations: {
                                UIView.addKeyframe(
                                    withRelativeStartTime: 0.0,
                                    relativeDuration: 0.5,
                                    animations: {
                                        self.setImageViewHeight(height: self.bounds.size.height)
                                    }
                                )
                                UIView.addKeyframe(
                                    withRelativeStartTime: 0.5,
                                    relativeDuration: 0.5,
                                    animations: {
                                        self.setImageViewHeight(height: self.pauseHeight)
                                    }
                                )
                            },
                            completion: nil
                        )
                    }
                    
                }
            )
            
        }
        
        private func pauseAnimated(animated: Bool) {
            if animated {
                UIView.animate(withDuration: 0.25) {
                    self.setImageViewHeight(height: self.pauseHeight)
                }
            } else {
                setImageViewHeight(height: pauseHeight)
            }
        }
        
        private func stopAnimated(animated: Bool) {
            if animated {
                UIView.animate(withDuration: 0.25) {
                    self.setImageViewHeight(height: 0.0)
                }
            } else {
                setImageViewHeight(height: 0.0)
            }
        }
        
        private func setImageViewHeight(height: CGFloat) {
            var frame = imageView.frame
            frame.size.height = height
            imageView.frame = frame
        }
        
        private func resetAnimations() {
            if let imageViewFrame = imageView.layer.presentation()?.frame {
                if !(imageViewFrame.equalTo(CGRect.zero)) {
                    imageView.frame = imageViewFrame
                }
            }
            imageView.layer.removeAllAnimations()
        }
    }
    
    #if TARGET_INTERFACE_BUILDER
    public override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.clear
    }

    override public func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
    
        context.clear(rect)
        
        let cumulativeSpacing = barSpacing * (CGFloat(barCount) - 1.0)
        let barWidth = (bounds.size.width - cumulativeSpacing) / CGFloat(barCount)
        let pauseHeight = bounds.size.height * 0.3
        context.setFillColor(tintColor.cgColor)
        for index in 0...barCount {
            let randomHeight = CGFloat(randomDoubleBetween(Double(pauseHeight), Double(bounds.size.height)))
            let x = (CGFloat(index) * barWidth) + (CGFloat(index) * barSpacing)
            let rect = CGRect(x: x, y: 0, width: barWidth, height: randomHeight)
            context.fill(rect)
        }
    }
    #endif

}

// MARK: Utility

func randomDoubleBetween(_ firstNum: Double, _ secondNum: Double) -> Double{
    return Double(arc4random()) / Double(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
}
