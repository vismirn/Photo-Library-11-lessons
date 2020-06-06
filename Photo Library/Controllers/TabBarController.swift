//
//  TabBarController.swift
//  Photo Library
//
//  Created by Viktor Smirnov on 05.06.2020.
//  Copyright © 2020 Viktor Smirnov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewC = CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let mainTableVC = MainTableViewController(style: .plain)
    
        
        guard let musicImage = UIImage(systemName: "music.house") else { return }
        guard let profileImage = UIImage(systemName: "person.crop.square") else { return }
        viewControllers = [generationNC(rootViewController: viewC, image: musicImage, title: "Музыка"),
                           generationNC(rootViewController: photosVC, image: profileImage, title: "Профиль"),
                           generationNC(rootViewController: mainTableVC, image: musicImage, title: "Музыка")]
        
        
    }
    
    func generationNC(rootViewController: UIViewController, image: UIImage, title: String) -> UINavigationController {
          
          let navigationVC = UINavigationController(rootViewController: rootViewController)
          
          navigationVC.tabBarItem.title = title
          navigationVC.tabBarItem.image = image
          
          return navigationVC
      }

}
