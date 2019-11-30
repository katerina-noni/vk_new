//
//  BigPhotosController.swift
//  VK App New
//
//  Created by Екатерина on 01/12/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

class BigPhotosController: UIViewController {
    enum AnimationDirection {
        case left
        case right
    }
    
    @IBOutlet var bigPhotoImageView: UIImageView! {
        didSet {
            bigPhotoImageView.isUserInteractionEnabled = true
        }
    }
    private let additionalImageView = UIImageView()
    
    public var photos: [UIImage] = []
    public var selectedPhotoIndex: Int = 0
    private var propertyAnimator: UIViewPropertyAnimator!
    private var animationDirection: AnimationDirection = .left

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard !photos.isEmpty else { return }
        bigPhotoImageView.image = photos[selectedPhotoIndex]
        
//        let leftSwipeGR = UISwipeGestureRecognizer(target: self, action: #selector(photoSwipeLeft(_:)))
//        leftSwipeGR.direction = .left
//        bigPhotoImageView.addGestureRecognizer(leftSwipeGR)
        
        view.insertSubview(additionalImageView, belowSubview: bigPhotoImageView)
        additionalImageView.contentMode = .scaleAspectFit
        additionalImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            additionalImageView.leadingAnchor.constraint(equalTo: bigPhotoImageView.leadingAnchor),
            additionalImageView.trailingAnchor.constraint(equalTo: bigPhotoImageView.trailingAnchor),
            additionalImageView.topAnchor.constraint(equalTo: bigPhotoImageView.topAnchor),
            additionalImageView.bottomAnchor.constraint(equalTo: bigPhotoImageView.bottomAnchor)
        ])
        
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(viewPanned(_:)))
        view.addGestureRecognizer(panGR)
    }
    
//    @objc func photoSwipeLeft(_ swipeGestureRecognizer: UISwipeGestureRecognizer) {
//        guard selectedPhotoIndex + 1 <= photos.count - 1 else { return }
//        
//        additionalImageView.transform = CGAffineTransform(translationX: 1.3*self.additionalImageView.bounds.width, y: 150).concatenating(CGAffineTransform(scaleX: 1.3, y: 1.3))
//        additionalImageView.image = photos[selectedPhotoIndex + 1]
//        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseInOut, animations: {
//            self.bigPhotoImageView.transform = CGAffineTransform(translationX: -1.5*self.bigPhotoImageView.bounds.width, y: -100).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
//            self.additionalImageView.transform = .identity
//        }) {_ in
//            self.selectedPhotoIndex += 1
//            self.bigPhotoImageView.image = self.photos[self.selectedPhotoIndex]
//            self.bigPhotoImageView.transform = .identity
//            self.additionalImageView.image = nil
//    }
//}
//
//    @IBAction func photoSwipeRight(_ sender: UISwipeGestureRecognizer) {
//        guard selectedPhotoIndex >= 1 else { return }
//        
//            additionalImageView.transform = CGAffineTransform(translationX: -1.3*self.additionalImageView.bounds.width, y: 150).concatenating(CGAffineTransform(scaleX: 1.3, y: 1.3))
//            additionalImageView.image = photos[selectedPhotoIndex - 1]
//            UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseInOut, animations: {
//                self.bigPhotoImageView.transform = CGAffineTransform(translationX: 1.5*self.bigPhotoImageView.bounds.width, y: -100).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
//                self.additionalImageView.transform = .identity
//            }) {_ in
//                self.selectedPhotoIndex -= 1
//                self.bigPhotoImageView.image = self.photos[self.selectedPhotoIndex]
//                self.bigPhotoImageView.transform = .identity
//                self.additionalImageView.image = nil
//        }
//    }
    @objc func viewPanned(_ panGestureRecognizer: UIPanGestureRecognizer){
        switch panGestureRecognizer.state {
        case .began:
            if panGestureRecognizer.translation(in: view).x > 0 {
                guard selectedPhotoIndex >= 1 else { return }
                
                animationDirection = .right
                additionalImageView.transform = CGAffineTransform(translationX: -1.3*self.additionalImageView.bounds.width, y: 150).concatenating(CGAffineTransform(scaleX: 1.3, y: 1.3))
                additionalImageView.image = photos[selectedPhotoIndex - 1]
                // движение направо
                propertyAnimator = UIViewPropertyAnimator(duration: 0.7, curve: .easeInOut, animations: {
                    self.bigPhotoImageView.transform = CGAffineTransform(translationX: 1.5*self.bigPhotoImageView.bounds.width, y: -100).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
                    self.additionalImageView.transform = .identity
                    
                })
                propertyAnimator.addCompletion{ position in
                    switch position {
                    case .end:
                        self.selectedPhotoIndex -= 1
                        self.bigPhotoImageView.image = self.photos[self.selectedPhotoIndex]
                        self.bigPhotoImageView.transform = .identity
                        self.additionalImageView.image = nil
                    case .start:
                        self.additionalImageView.transform = CGAffineTransform(translationX: -1.3*self.additionalImageView.bounds.width, y: 150).concatenating(CGAffineTransform(scaleX: 1.3, y: 1.3))
                    case .current:
                        break
                    @unknown default:
                        break
                    }
                }
            } else {
                // движение налево
                 guard selectedPhotoIndex + 1 <= photos.count - 1 else { return }
                               
                animationDirection = .left
                additionalImageView.transform = CGAffineTransform(translationX: 1.3*self.additionalImageView.bounds.width, y: 150).concatenating(CGAffineTransform(scaleX: 1.3, y: 1.3))
                additionalImageView.image = photos[selectedPhotoIndex + 1]
                propertyAnimator = UIViewPropertyAnimator(duration: 0.7, curve: .easeInOut, animations: {
                self.bigPhotoImageView.transform = CGAffineTransform(translationX: -1.5*self.bigPhotoImageView.bounds.width, y: -100).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
                self.additionalImageView.transform = .identity
                })
                propertyAnimator.addCompletion{ position in
                switch position {
                case .end:
                    self.selectedPhotoIndex += 1
                    self.bigPhotoImageView.image = self.photos[self.selectedPhotoIndex]
                    self.bigPhotoImageView.transform = .identity
                    self.additionalImageView.image = nil
                case .start:
                    self.additionalImageView.transform = CGAffineTransform(translationX: 1.3*self.additionalImageView.bounds.width, y: 150).concatenating(CGAffineTransform(scaleX: 1.3, y: 1.3))
                case .current:
                    break
                @unknown default:
                    break
                    }
                }
            }
        case .changed:
            guard let propertyAnimator = self.propertyAnimator else { return }
            switch animationDirection {
            case .right:
                let percent = min(max(0, panGestureRecognizer.translation(in: view).x / 200), 1)
                propertyAnimator.fractionComplete = percent
            case .left:
                let percent = min(max(0, -panGestureRecognizer.translation(in: view).x / 200), 1)
                propertyAnimator.fractionComplete = percent
            }
        case .ended:
            guard let propertyAnimator = self.propertyAnimator else { return }
            if propertyAnimator.fractionComplete > 0.33 {
                propertyAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
            } else {
                propertyAnimator.isReversed = true
                propertyAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
            }
        default:
            break
        }
    }
    
}
