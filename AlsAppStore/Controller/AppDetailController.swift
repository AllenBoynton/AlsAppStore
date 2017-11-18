//
//  AppDetailController.swift
//  AlsAppStore
//
//  Created by Allen Boynton on 11/10/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

class AppDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let headerId = "headerId"
    private let cellId = "cellId"
    
    var app: App? {
        didSet {
            navigationItem.title = app?.Name
            
            if app?.Screenshots != nil {
                return
            }
            
            if let id = app?.Id {
                if let file = Bundle.main.url(forResource: "alsAppStoreDetails\(id)", withExtension: "json") {
                    URLSession.shared.dataTask(with: file) { (data, response, error) -> Void in
                        
                        guard let data = data else { return }
                        
                        if let error = error {
                            print(error)
                            return
                        }
                        
                        do {
                            let decoder = JSONDecoder()
                            let appDetail = try decoder.decode(App.self, from: data)
                            
                            self.app = appDetail
                            
                            DispatchQueue.main.async(execute: { () -> Void in
                                self.collectionView?.reloadData()
                            })
                            
                        } catch let err {
                            print(err)
                        }
                        
                    }.resume()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = .white
        
        collectionView?.register(AppDetailHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(ScreenshotsCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotsCell
        cell.app = app
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppDetailHeader
        header.app = app
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 170)
    }
}

