//
//  ViewController.swift
//  CWCollectionView
//
//  Created by Valentin Denis on 12/07/2018.
//  Copyright © 2018 Cwep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cwCollectionView: CWCollectionView!

    var dataSource : [Int : [UIImage?]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = [
            0 :
            [#imageLiteral(resourceName: "crepe_froment"), #imageLiteral(resourceName: "crepe_froment"), #imageLiteral(resourceName: "crepe_froment"), #imageLiteral(resourceName: "crepe_froment"), #imageLiteral(resourceName: "crepe_froment"), #imageLiteral(resourceName: "crepe_froment"), #imageLiteral(resourceName: "crepe_froment"), #imageLiteral(resourceName: "crepe_froment")],
            1:
            [#imageLiteral(resourceName: "crepe_sarrasin"), #imageLiteral(resourceName: "crepe_sarrasin"), #imageLiteral(resourceName: "crepe_sarrasin")],
        ]
        
        cwCollectionView.cwDelegate = self
        cwCollectionView.reloadData()
    }

}

extension ViewController : CWCollectionViewDelegate {
    func numberOfColumns() -> Int {
        return 2
    }
    
    func itemHeightRatio() -> CGFloat {
        return 0.5
    }
    
    func sectionInsets() -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func itemMinimumMargin() -> CGFloat {
        return 8.0
    }
    
    func headerHeight() -> CGSize {
        return CGSize.init(width: cwCollectionView.bounds.size.width, height: 50)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CWCellID", for: indexPath) as? CWCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.fill(withImage: dataSource[indexPath.section]?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view : UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CWHeader", for: indexPath)
        let label : UILabel = UILabel.init(frame: view.frame)
        label.textAlignment = .center
        switch indexPath.section {
        case 0:
            label.text = "Froment"
        case 1:
            label.text = "Sarrasin"
        default:
            label.text = "Autres"
        }
        view.addSubview(label)
        return view
    }
    
}

