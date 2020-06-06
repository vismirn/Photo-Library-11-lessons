//
//  ViewController.swift
//  Photo Library
//
//  Created by Viktor Smirnov on 30.05.2020.
//  Copyright © 2020 Viktor Smirnov. All rights reserved.
//

import UIKit

struct User {
    var name: String
    var age: Int
}

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let searchController = UISearchController()
    
    let users = [User(name: "Alexey", age: 13), User(name: "Bob", age: 13)]
    let networkService = NetworkService()
    let dataFetch = NetworkDataFetcher()
    let itemsInRow: CGFloat = 12
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    var timer: Timer?
    var myPhotos: [Photo] = [] // Создал пустой массив
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        setupNavigationController()
        
        networkService.request(searchText: "RainBow") { (myData, myError) in
    
            
        }
        
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseIdentifier)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            
            //            layout.itemSize = CGSize(width: 100, height: 100)
            //
            //            layout.minimumLineSpacing = 20
            //            layout.minimumInteritemSpacing = 50
        }
        
    }
    
    //приставка objc ставиться только если функция идёт в #selector (метод, выше)
    @objc func addButtonPressed() {
        
    }
    
    @objc func sharedButtonPressed() {
        
    }
    
    func setupNavigationController() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        let sharedButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedButtonPressed))
        navigationItem.rightBarButtonItems = [sharedButton, addButton]
        
        let titleLabel = UILabel()
        titleLabel.text = "PHOTOS"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = .darkGray
        let photoTitle = UIBarButtonItem.init(customView: titleLabel)
        navigationItem.leftBarButtonItem = photoTitle
        
        title = "Title"
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    // MARK: - UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return myPhotos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseIdentifier, for: indexPath) as! PhotoCell
        cell.backgroundColor = .red
        
        let array = [1,4,5,7,9,0]
            
        
        
        //        let number = array[indexPath.item]
        
        return cell
        
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let paddingSpace = sectionInserts.left * (itemsInRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsInRow
        
        
        return CGSize(width: widthPerItem, height: widthPerItem)
        
        //        return CGSize(width: 100, height: 100)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left // Здесь будет 20
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //        return sectionInserts.left // Здесь будет 20
    //    }
    
    
}

extension CollectionViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
            self.dataFetch.fetchPhotos(searchText: searchText) { (searchPhotoResults) in
                guard let mySearchResponse = searchPhotoResults else { return }
                self.myPhotos = mySearchResponse.results // Заполняем массив данными из интернета
                self.collectionView.reloadData() // Обовляем коллекцию
            }
        })
     print(searchText)
    }
    
}
