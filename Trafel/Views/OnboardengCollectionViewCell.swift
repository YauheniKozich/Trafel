//
//  OnboardengCollectionViewCell.swift
//  Trafel
//
//  Created by Yauheni Kozich on 26.11.20.
//

import UIKit

class OnboardengCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    
    func configure(image: UIImage) {
        slideImageView.image = image
    }
}
