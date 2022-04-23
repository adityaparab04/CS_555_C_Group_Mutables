//
//  animations.swift
//  Mutables
//
//  Created by Rahul Pawar on 4/23/22.
//

import Foundation
import UIKit
import Lottie


class Animations{
    func setupAnimation(animationView: AnimationView, animationName: String, view: UIView){
        animationView.animation = Animation.named(animationName)
        animationView.frame = animationView.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        print("Thank you animation")
    }
}
