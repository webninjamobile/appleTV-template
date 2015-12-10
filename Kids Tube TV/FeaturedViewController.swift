//
//  FirstViewController.swift
//  Kids Tube TV
//
//  Created by keithics on 11/30/15.
//  Copyright © 2015 Web Ninja Technologies. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController ,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    
    @IBOutlet var featuredCollectionView: UICollectionView!
    @IBOutlet var mostViewedCollectionView: UICollectionView!
    
    
    let reuseIdentifierFeatured = "FeaturedCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.featuredCollectionView.registerClass(FeaturedCustomCell.self, forCellWithReuseIdentifier: "FeaturedCustomCell")

    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.featuredCollectionView.selectItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 0), animated: true, scrollPosition: .CenteredHorizontally)
    }
    
   
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if (collectionView == self.featuredCollectionView)
        {
            return setCell("FeaturedCustomCell", indexPath: indexPath, currentCollection : featuredCollectionView) as! FeaturedCustomCell
        }
        
        if (collectionView == self.mostViewedCollectionView)
        {
            return setCell("GenericCustomCell", indexPath: indexPath, currentCollection : mostViewedCollectionView) as! GenericCustomCell
        }
        
        return UICollectionViewCell()
    }
    
    func setCell(id:String, indexPath: NSIndexPath , currentCollection: UICollectionView) -> UICollectionViewCell{
        let nibName = UINib(nibName: id, bundle:nil)
        currentCollection.registerNib(nibName, forCellWithReuseIdentifier: id)
        
        return currentCollection.dequeueReusableCellWithReuseIdentifier(id, forIndexPath: indexPath)
        
    }
    
   
}

