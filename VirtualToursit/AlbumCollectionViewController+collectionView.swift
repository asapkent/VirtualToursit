//
//  AlbumCollectionViewController+collectionView.swift
//  VirtualToursit
//
//  Created by Robert Jeffers on 2/22/21.
//

import Foundation
import UIKit

extension AlbumCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }
    
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // CollectionView
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoViewCell.reuseIdentifier, for: indexPath as IndexPath) as! PhotoViewCell
         guard !(self.fetchedResultsController.fetchedObjects?.isEmpty)! else {
             print("images are already present.")
             return cell
         }
     
         // fetch core data
         let photoData = self.fetchedResultsController.object(at: indexPath)

         
         if photoData.imageData == nil {
             // run thread
             deleteButton.isEnabled = false
             DispatchQueue.global(qos: .background).async {
                 if let imageData = try? Data(contentsOf: photoData.imageUrl!) {
                     DispatchQueue.main.async {
                         photoData.imageData = imageData
                         do {
                             try self.dataController.viewContext.save()
                             
                         } catch {
                             print("error in saving image data")
                         }
                         
                         let image = UIImage(data: imageData)!
                       //  print("index is: \(indexPath.row)")
                         cell.setPhotoImageView(imageView: image, sizeFit: true)
          
                     }
                 }
         
             }
             
         } else {
           if let imageData = photoData.imageData {
                 let image = UIImage(data: imageData)!
                 cell.setPhotoImageView(imageView: image, sizeFit: false)
             }
             
         }
         deleteButton.isEnabled = true
         return cell
     }
    
    func setUpCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        //collectionView.allowsMultipleSelection = true
        configureFlowLayout()
    }

    func configureFlowLayout() {
    
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumLineSpacing = 1
            flowLayout.minimumInteritemSpacing = 1

            let sidesMetric = (collectionView.frame.width / 3) - 1
            flowLayout.itemSize = CGSize(width: sidesMetric, height: sidesMetric)
            flowLayout.headerReferenceSize = CGSize(width: collectionView.frame.width, height: 50)
        }
  }
}
