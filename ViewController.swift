//
//  ViewController.swift
//  animation
//
//  Created by Dany on 29.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
   
let coloroView = UIImageView(frame: CGRect(x: 16, y: 100, width: 100, height: 100))
    var isSelected: Bool = false
    let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        button.imageView?.tintColor = .darkGray
        button.imageView?.contentMode = .scaleAspectFill
        button.imageEdgeInsets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(coloroView)
        view.addSubview(self.button)
        view.backgroundColor = .systemGray5
        button.isHidden = true
        button.frame = CGRect(x: self.view.frame.width - 66, y: 100, width: 50, height: 50)
        coloroView.image = UIImage(named: "7")
        coloroView.layer.borderWidth = 5
        coloroView.clipsToBounds = true
        coloroView.contentMode = .scaleAspectFill
        coloroView.layer.cornerRadius = 50
        coloroView.layer.borderColor = UIColor.white.cgColor
        coloroView.backgroundColor = .systemGray5
        self.button.addTarget(self, action: #selector(tappedX), for: .touchUpInside)
        coloroView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapGesture.numberOfTouchesRequired = 1
        coloroView.addGestureRecognizer(tapGesture)
    }
    
   
    @objc func tappedX() {
        UIImageView.animate(withDuration: 0.5) {
            self.button.isHidden = true
            self.coloroView.alpha = 10
            self.coloroView.contentMode = .scaleAspectFill
            self.coloroView.frame = CGRect(x: 16, y: 100, width: 100, height: 100)
            
            self.coloroView.layer.borderWidth = 5
            self.coloroView.layer.cornerRadius = 50
        }
        
    }

   
    @objc func tap(tapGestureRecognizer: UITapGestureRecognizer) {
        print("helooooooooooooo")
        
        UIImageView.animateKeyframes(withDuration: 0.5, delay: 0, options: [],
                                     animations: {
                                        UIImageView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 4) {
                                            self.coloroView.contentMode = .scaleAspectFit
                                            self.coloroView.frame = CGRect(x: 16, y: 100, width: self.view.frame.width - 32, height: self.view.frame.height - 300)
                                            //self.coloroView.alpha = 0.5
                                            self.coloroView.layer.borderWidth = 0
                                            self.coloroView.layer.cornerRadius = 0
                                        }
                                     }, completion: {
                                        finished in
                                        UIView.animateKeyframes(withDuration: 10, delay: 3, options: [], animations: {
                                            self.button.isHidden = false
                                        })
                                     })
    }
}

