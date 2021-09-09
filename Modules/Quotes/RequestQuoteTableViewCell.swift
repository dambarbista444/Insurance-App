//
//  RequestQuoteTableViewCell.swift
//  Quotes
//
//  Created by Dambar Bista on 9/6/21.
//

import UIKit

/// For the collectionViews i am thinking to convert in to mvvm. for now i am figuring out how to do that. 
class RequestQuoteTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var auto = ["$680", "$600", "$780"]
    var home = ["$200", "$500", "$600"]
    var health = ["$480", "$600", "$1200"]
    var quotesTitles = ["Auto", "Home", "Health"]
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let collectView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectView.register(RequestQuoteCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectView.showsHorizontalScrollIndicator = false
        collectView.translatesAutoresizingMaskIntoConstraints = false
        return collectView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
        setUpConstraints()
        
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    private func addViews() {
        contentView.addSubview(collectionView)
    }
    
    
    private func setUpConstraints() {
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RequestQuoteCollectionViewCell
   
        if indexPath.section == 0 {
            cell.priceLabel.text = quotesTitles[indexPath.row]
            cell.priceLabel.font = .boldSystemFont(ofSize: 18)
            
        } else if indexPath.section == 1 {
            cell.priceLabel.text = auto[indexPath.row]
            
        } else if indexPath.section == 2 {
            cell.priceLabel.text = home[indexPath.row]
            
        } else if indexPath.section == 3 {
            cell.priceLabel.text = health[indexPath.row]
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        var edgeInset = UIEdgeInsets()
        if section == 0 {
          edgeInset =  UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        }
        
        return edgeInset
    }
    
}

// MARK:- Protocols
public protocol RequestQuoteTableViewCellConfigurable {}


// MARK:- View model
class RequestQuoteTableViewCellViewModel: RequestQuoteTableViewCellConfigurable {}
