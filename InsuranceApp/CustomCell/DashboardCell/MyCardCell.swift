//
//  MyIDsCell.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/24/21.
//

import UIKit
import SnapKit

class MyCardCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    var myCards = [MyCards]()
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let collectView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectView.register(MyCardCollectionsViewCill.self, forCellWithReuseIdentifier: "collectionCell")
        layout.scrollDirection = .horizontal
        collectView.showsHorizontalScrollIndicator = false
        collectView.isPagingEnabled = true
        collectView.translatesAutoresizingMaskIntoConstraints = false
        return collectView
    }()
    
    
    let pageController: UIPageControl = {
        let pageControl = UIPageControl()
        return pageControl
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
        setUpConstraints()
        contentView.backgroundColor = .gray
        contentView.layer.cornerRadius = 15
        collectionView.layer.cornerRadius = 15
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        myCards = [
            MyCards(name: "Discover"),
            MyCards(name: "PNC"),
            MyCards(name: "American Express")
        ]
    }
    
    
    private func addViews() {
        contentView.addSubview(collectionView)
        contentView.addSubview(pageController)
    }
    
    
    private func setUpConstraints() {
        pageController.frame = CGRect(x: 150, y: 240, width: 50, height: 20)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.left.equalTo(contentView.snp.left).offset(20)
            make.right.equalTo(contentView.snp.right).offset(-20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageController.numberOfPages = myCards.count
        return myCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MyCardCollectionsViewCill
        cell.cardName.text = myCards[indexPath.item].name
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 240)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageController.currentPage = indexPath.section
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width - scrollView.contentInset.left * 2
        let index = scrollView.contentOffset.x / width
        let roundIndex = round(index)
        self.pageController.currentPage = Int(roundIndex)
    }
    

    
    
    
    
    
    
}
