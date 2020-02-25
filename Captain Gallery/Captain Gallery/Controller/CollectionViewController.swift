//
//  CollectionViewController.swift
//  Captain Gallery
//
//  Created by Home on 7/30/19.
//  Copyright © 2019 Aswini. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController
{
    var photoLibrary = PhotoLibrary.generatePhotoLibrary()
    @IBOutlet weak var addButtonItem: UIBarButtonItem!
    
    struct StoryBoard {
        static let cellIdentifier = "PhotoCell"
        static let headerIdentifier = "SectionHeaderView"
        static let segueIdentifier = "showSegue"
        static let leftRightPadding: CGFloat = 2.0
        static let numberOfItemPerRow: CGFloat = 3.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let collectionViewWidth = collectionView.frame.width
        let itemWidth = (collectionViewWidth - StoryBoard.leftRightPadding) / StoryBoard.numberOfItemPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
    }
    // MARK :- COLLECTIONVIEW DATASOURCE
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return photoLibrary.count
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoLibrary[section].PhotoImageNames.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoard.cellIdentifier, for: indexPath) as! PhotoCell
        cell.imageName = photoLibrary[indexPath.section].PhotoImageNames[indexPath.item]
        cell.isEditing = false
        cell.visualEffectViewDelegate = self
        return cell
    }
    // MARK :- TARGET/ACTION
    
    @IBAction func addItem(_ sender: Any) {
        photoLibrary[0].PhotoImageNames.append("Captain-America")
        let insertedIndexPath = IndexPath(item: photoLibrary[0].PhotoImageNames.count - 1, section: 0)
        collectionView.insertItems(at: [insertedIndexPath])
        //collectionView.reloadData()
    }
    
    // MARK :- DELETE ITEM
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        addButtonItem.isEnabled = !editing
        let indexPaths = collectionView.indexPathsForVisibleItems
            for indexPath in indexPaths {
                let cell = collectionView.cellForItem(at: indexPath) as! PhotoCell
                cell.isEditing = editing
            }
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderView", for: indexPath) as! SectionHeaderView
        headerView.headerData = photoLibrary[indexPath.section]
    
        return headerView
    }
    // MARK :- COLLECTIONVIEW DELEGATE
    var imageName: String?
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         imageName = photoLibrary[indexPath.section].PhotoImageNames[indexPath.item]
        performSegue(withIdentifier: StoryBoard.segueIdentifier, sender: nil)
    }
    // MARK :- NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryBoard.segueIdentifier {
            let dvc = segue.destination as! DetailViewController
            dvc.imageName = imageName!
        }
    }
}

extension CollectionViewController: VisualEffectViewDelegate {
    func onClickDelete(collectionViewCell: UICollectionViewCell) {
        let indexPath = collectionView.indexPath(for: collectionViewCell)
        if let indexSection = indexPath?.section, let indexItem = indexPath?.item {
            photoLibrary[indexSection].PhotoImageNames.remove(at: indexItem)
            let newIndexPath = IndexPath(item: indexItem, section: indexSection)
            collectionView.deleteItems(at: [newIndexPath])
        }
    }
}
