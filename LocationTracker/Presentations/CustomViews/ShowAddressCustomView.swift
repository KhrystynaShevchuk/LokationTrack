//
//  ShowAddressCustomView.swift
//  LocationTracker
//
//  Created by KhrystynaShevchuk on 7/4/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import UIKit

@IBDesignable
class ShowAddressCustomView: UIView {
    
    // Root view - needs in case it loads(creates) from code
    private var view: UIView!

    @IBOutlet weak var addressTextView: UITextView!
    
    // For using CustomView in code
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
    }
    
    // For using CustomView in IB
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
    }
    
    private func xibSetup() {
        view = loadViewFromNib("ShowAddressCustomView")
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
        
        setup()
    }
    
    private func loadViewFromNib(nibName: String) -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    private func setup() {
        addressTextView.layer.cornerRadius = 8.0
        addressTextView.clipsToBounds = true
        addressTextView.layer.borderColor = UIColor.greenColor().CGColor
        addressTextView.layer.borderWidth = 2
    }
    
    func setPopupOnView(yPosition: CGFloat, width: CGFloat) { // set it in VC
        UIView.animateWithDuration(0.7, delay: 1.0, options: .CurveEaseOut, animations: {

            self.frame = CGRect(x: 0, y: yPosition, width: width, height: 100)
        }) { finished in
        }
    }
}