//
//  CWCollectionViewCell.swift
//  CWCollectionView
//
//  Created by Valentin Denis on 12/07/2018.
//  Copyright © 2018 Cwep. All rights reserved.
//

import UIKit

class CWCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    func fill(withImage image:UIImage?) {
        itemImageView.image = image
    }
}
