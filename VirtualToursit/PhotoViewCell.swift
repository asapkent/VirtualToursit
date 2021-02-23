//
//  PhotoViewCell.swift
//  VirtualToursit
//
//  Created by Robert Jeffers on 2/22/21.
//

import UIKit
import CoreData

class PhotoViewCell: UICollectionViewCell {
    
   
    @IBOutlet weak var photoImageView: UIImageView!

    static let reuseIdentifier = "PhotoViewCell"
    

    func setPhotoImageView(imageView: UIImage, sizeFit: Bool) {
        photoImageView.image = imageView
        if sizeFit == true {
            photoImageView.sizeToFit()
        }
    }
}
