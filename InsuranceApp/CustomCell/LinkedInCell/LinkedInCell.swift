//
//  LinkedInCell.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/26/21.
//

import UIKit
import SnapKit

class LinkedInCell: UITableViewCell {
    
    let topRowView = UIView()
    let bottomRowView = UIView()
    let postReactorNameLabel = UILabel()
    let userLikeReactionLabel = UILabel()
    let threeDotsImageView = UIImageView()
    let profileImageView = UIImageView()
    let profileNameLabel = UILabel()
    let professionLabel = UILabel()
    let industyLabel = UILabel()
    let postedDayLabel = UILabel()
    let dotLabel = UILabel()
    let plusIcon = UIImageView()
    let followlabel = UILabel()
    let publicIcon = UILabel()
    let connectionLevel = UILabel()
    let secondDotLabel = UILabel()
    let postLabel = UILabel()
    let postImageView = UIImageView()
    let thumpUpIconImageView = UIImageView()
    let heartIconImageView = UIImageView()
    let clapIconImageView = UIImageView()
    let numberOfLikesLabel = UILabel()
    let commentsLabel = UILabel()
    let numberOfCommentsLabel = UILabel()
    let likeLabel = UILabel()
    let commentIconLabel = UILabel()
    let shareLabel = UILabel()
    let sendLabel = UILabel()
    let likeIconImageview = UIImageView()
    let commentIconImageView = UIImageView()
    let shareIconImageView = UIImageView()
    let sendIconImageView = UIImageView()
    
    /// StackViews
    let parentStackView = UIStackView()
    let UserReactionStackView = UIStackView()
    let nameAndConnectionLevelStackView = UIStackView()
    let addAndFollowStackView = UIStackView()
    let professionAndIndustyStackView = UIStackView()
    let postedDayAndShareingModeStackView = UIStackView()
    let bioStackView = UIStackView()
    let postStackView = UIStackView()
    let LikesStackView = UIStackView()
    let commentsStackView = UIStackView()
    let likeIconStackView = UIStackView()
    let commentIconStackView = UIStackView()
    let shareIconStackView = UIStackView()
    let sendIconStackView = UIStackView()
    let lowerHorizontalStackView = UIStackView() // this will hold all the like , comments icon etc in the last row
    
    
    
    let randomText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let mainView = UIView()
        
        addViews(view: mainView)
        setUpConstraint(with: parentStackView, and: mainView)
        changeColorOfItems()
        configureLabelsFromExtension()
        configureStackViewsFromExtension()
        configureImageViewsFromExtension()
    }
    
    
    private func changeColorOfItems() {
        topRowView.backgroundColor = .gray
        followlabel.textColor = .purple
        bottomRowView.backgroundColor = .gray
    }
    
    private func addViews(view: UIView) {
        contentView.addSubview(view)
        
        view.addSubview(parentStackView)
        parentStackView.addSubview(topRowView)
        parentStackView.addSubview(UserReactionStackView)
        parentStackView.addSubview(threeDotsImageView)
        parentStackView.addSubview(profileImageView)
        parentStackView.addSubview(bioStackView)
        bioStackView.addSubview(nameAndConnectionLevelStackView)
        bioStackView.addSubview(professionAndIndustyStackView)
        bioStackView.addSubview(postedDayAndShareingModeStackView)
        parentStackView.addSubview(addAndFollowStackView)
        parentStackView.addSubview(postImageView)
        parentStackView.addSubview(postLabel)
        parentStackView.addSubview(bottomRowView)
        parentStackView.addSubview(LikesStackView)
        parentStackView.addSubview(commentsStackView)
        parentStackView.addSubview(lowerHorizontalStackView)
        lowerHorizontalStackView.addSubview(likeIconStackView)
        lowerHorizontalStackView.addSubview(commentIconStackView)
        lowerHorizontalStackView.addSubview(shareIconStackView)
        lowerHorizontalStackView.addSubview(sendIconStackView)
    }
    
    
    private func configureStackViewsFromExtension() {
        
        nameAndConnectionLevelStackView.reuseableStackview(axis: .horizontal, alignment: .top, distribution: .fill, spacing: 5, arrangedSubviews: [profileNameLabel, dotLabel, connectionLevel])
        
        addAndFollowStackView.reuseableStackview(axis: .horizontal, alignment: .top, distribution: .fill, spacing: 5, arrangedSubviews: [plusIcon, followlabel])
        
        UserReactionStackView.reuseableStackview(axis: .horizontal, alignment: .top, distribution: .fill, spacing: 5, arrangedSubviews: [postReactorNameLabel, userLikeReactionLabel])
        
        professionAndIndustyStackView.reuseableStackview(axis: .vertical, alignment: .leading, distribution: .fill, spacing: 5, arrangedSubviews: [professionLabel, industyLabel])
        
        postedDayAndShareingModeStackView.reuseableStackview(axis: .horizontal, alignment: .top, distribution: .fill, spacing: 5, arrangedSubviews: [postedDayLabel, secondDotLabel, publicIcon])
        
        bioStackView.reuseableStackview(axis: .vertical, alignment: .leading, distribution: .fill, spacing: 2, arrangedSubviews: [nameAndConnectionLevelStackView, professionAndIndustyStackView, postedDayAndShareingModeStackView])
        
        LikesStackView.reuseableStackview(axis: .horizontal, alignment: .top, distribution: .fill, spacing: 2, arrangedSubviews: [thumpUpIconImageView, heartIconImageView, clapIconImageView, numberOfLikesLabel])
        
        commentsStackView.reuseableStackview(axis: .horizontal, alignment: .top, distribution: .fill, spacing: 2, arrangedSubviews: [numberOfCommentsLabel, commentsLabel])
        
        likeIconStackView.reuseableStackview(axis: .vertical, alignment: .center, distribution: .fill, spacing: 2, arrangedSubviews: [likeIconImageview, likeLabel])
        /// this is lower comment  stackview with icon
        commentIconStackView.reuseableStackview(axis: .vertical, alignment: .center, distribution: .fill, spacing: 2, arrangedSubviews: [commentIconImageView, commentIconLabel])
        
        shareIconStackView.reuseableStackview(axis: .vertical, alignment: .center, distribution: .fill, spacing: 2, arrangedSubviews: [shareIconImageView, shareLabel])
        
        sendIconStackView.reuseableStackview(axis: .vertical, alignment: .center, distribution: .fill, spacing: 2, arrangedSubviews: [sendIconImageView, sendLabel])
        
        
        lowerHorizontalStackView.reuseableStackview(axis: .horizontal, alignment: .center, distribution: .equalSpacing, spacing: 5, arrangedSubviews: [likeIconStackView, commentIconStackView, shareIconStackView, sendIconStackView])
        
    }
    
    /// Many of labels height and width were hard coded , i am aware of this for contents height and width can be change anytime. i still chose this way becuse i have already created reuseable lable fix height and width and used every where  now if i change now i will to have fix every other label. And also the purpose of this page  was to learn constraints  and i give fix height and weight. learning from mistake.
    private func configureLabelsFromExtension() {
        let contentViewWidth = contentView.frame.width
        postReactorNameLabel.reuseableBoldTextLabel(text: "Jeff Morgan", textAlignment: .left, heightConstant: 20, widthConstant: 105, fontSize: 18)
        
        userLikeReactionLabel.reuseableLabel(text: "likes this", textAlignment: .left, heightConstant: 20, widthConstant: 100, fontSize: 16)
        
        profileNameLabel.reuseableBoldTextLabel(text: "Stephanie Stuckey", textAlignment: .left, heightConstant: 20, widthConstant: contentViewWidth/2, fontSize: 18)
        
        dotLabel.reuseableLabel(text: "●", textAlignment: .left, heightConstant: 20, widthConstant: 5, fontSize: 5)
        
        secondDotLabel.reuseableLabel(text: "●", textAlignment: .left, heightConstant: 20, widthConstant: 5, fontSize: 5)
        
        connectionLevel.reuseableLabel(text: "3rd+", textAlignment: .left, heightConstant: 20, widthConstant: 40, fontSize: 16)
        
        professionLabel.reuseableLabel(text: "Chief Executive officer at Stuckey's", textAlignment: .left, heightConstant: 20, widthConstant: contentViewWidth - 50, fontSize: 14)
        
        industyLabel.reuseableLabel(text: "Corporation", textAlignment: .left, heightConstant: 20, widthConstant: contentViewWidth/2, fontSize: 14)
        
        postedDayLabel.reuseableLabel(text: "4d", textAlignment: .left, heightConstant: 20, widthConstant: 20, fontSize: 14)
        
        followlabel.reuseableBoldTextLabel(text: "Follow", textAlignment: .left, heightConstant: 20, widthConstant: 50, fontSize: 16)
        
        publicIcon.reuseableLabel(text: "◉", textAlignment: .left, heightConstant: 20, widthConstant: 20, fontSize: 20) // change image later
        
        postLabel.reuseableLabel(text: randomText, textAlignment: .left, heightConstant: 100, widthConstant: contentViewWidth + 30, fontSize: 16)
        postLabel.numberOfLines = 0
        
        numberOfLikesLabel.reuseableLabel(text: "10,348", textAlignment: .left, heightConstant: 20, widthConstant: 80, fontSize: 16)
        
        numberOfCommentsLabel.reuseableLabel(text: "995", textAlignment: .left, heightConstant: 20, widthConstant: 30, fontSize: 16)
        
        commentsLabel.reuseableLabel(text: "comments", textAlignment: .left, heightConstant: 20, widthConstant: 80, fontSize: 16)
        
        likeLabel.reuseableLabel(text: "Like", textAlignment: .left, heightConstant: 20, widthConstant: 30, fontSize: 16)
        
        commentIconLabel.reuseableLabel(text: "Comment", textAlignment: .left, heightConstant: 20, widthConstant: 80, fontSize: 16)
        
        shareLabel.reuseableLabel(text: "Share", textAlignment: .left, heightConstant: 20, widthConstant: 45, fontSize: 16)
        
        sendLabel.reuseableLabel(text: "Send", textAlignment: .left, heightConstant: 20, widthConstant: 45, fontSize: 16)
    }
    
    
    private func configureImageViewsFromExtension() {
        threeDotsImageView.reuseableImageView(image: UIImage(named: "dots.png")!)
        profileImageView.reuseableImageView(image: UIImage(named: "agentImg.jpg")!)
        plusIcon.reuseableImageView(image: UIImage(systemName: "plus")!)
        postImageView.reuseableImageView(image: UIImage(named: "swiftLogo.png")!)
        
        thumpUpIconImageView.reuseableImageView(image: UIImage(systemName: "hand.thumbsup.fill")!)
        heartIconImageView.reuseableImageView(image: UIImage(systemName: "heart.fill")!)
        clapIconImageView.reuseableImageView(image: UIImage(systemName: "hands.clap.fill")!)
        
        likeIconImageview.reuseableImageView(image: UIImage(systemName: "hand.thumbsup")!)
        commentIconImageView.reuseableImageView(image: UIImage(systemName: "text.bubble")!)
        shareIconImageView.reuseableImageView(image: UIImage(systemName: "arrow.turn.up.right")!)
        sendIconImageView.reuseableImageView(image: UIImage(systemName: "paperplane")!)
    }
    
    
    
    private func setUpConstraint(with superStackView: UIStackView, and view: UIView) {
        
        view.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        
        
        parentStackView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        
        UserReactionStackView.snp.makeConstraints { make in
            make.top.equalTo(parentStackView.snp.top)
            make.left.equalTo(parentStackView.snp.left)
            make.height.equalTo(40)
        }
        
        
        threeDotsImageView.snp.makeConstraints { make in
            make.top.equalTo(parentStackView.snp.top)
            make.right.equalTo(parentStackView.snp.right)
            make.width.equalTo(40)
            make.width.equalTo(40)
            
        }
        
        
        topRowView.snp.makeConstraints { make in
            make.top.equalTo(parentStackView.snp.top).offset(30)
            make.left.equalTo(parentStackView.snp.left).offset(5)
            make.right.equalTo(parentStackView.snp.left)
            make.height.equalTo(1)
            make.width.equalTo(500)
        }
        
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(topRowView.snp.bottom).offset(20)
            make.left.equalTo(parentStackView.snp.left)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        
        addAndFollowStackView.snp.makeConstraints { make in
            
            make.top.equalTo(topRowView.snp.bottom).offset(10)
            make.right.equalTo(parentStackView.snp.right)
            make.height.equalTo(40)
            make.width.equalTo(70)
        }
        
        
        bioStackView.snp.makeConstraints { make in
            
            make.top.equalTo(topRowView.snp.bottom).offset(10)
            make.left.equalTo(profileImageView.snp.right).offset(10)
            make.right.equalTo(addAndFollowStackView.snp.left)
            make.height.equalTo(80)
        }
        
        
        postLabel.snp.makeConstraints { make in
            make.top.equalTo(bioStackView.snp.bottom)
            make.left.equalTo(parentStackView.snp.left)
            make.right.equalTo(parentStackView.snp.right)
            make.height.equalTo(100)
        }
        
        
        postImageView.snp.makeConstraints { make in
            make.top.equalTo(postLabel.snp.bottom)
            make.left.equalTo(parentStackView.snp.left)
            make.right.equalTo(parentStackView.snp.right)
            make.height.equalTo(280)
        }
        
        
        LikesStackView.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp.bottom).offset(12)
            make.left.equalTo(parentStackView.snp.left).offset(10)
            make.bottom.equalTo(bottomRowView.snp.top).offset(-15)
        }
        
        
        commentsStackView.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp.bottom).offset(12)
            make.right.equalTo(parentStackView.snp.right).offset(-10)
            make.bottom.equalTo(bottomRowView.snp.top).offset(-15)
        }
        
        
        bottomRowView.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp.bottom).offset(45)
            make.left.equalTo(parentStackView.snp.left).offset(5)
            make.right.equalTo(parentStackView.snp.left)
            make.height.equalTo(1)
            make.width.equalTo(500)
        }
        
        
        lowerHorizontalStackView.snp.makeConstraints { make in
            make.top.equalTo(bottomRowView.snp.bottom).offset(5)
            make.left.equalTo(parentStackView.snp.left).offset(20)
            make.right.equalTo(parentStackView.snp.right).offset(-20)
            make.bottom.equalTo(parentStackView.snp.bottom)
        }
        
    }
    
    // giving space between rows
    override var frame: CGRect {
        get {
            return super.frame
        }
        
        set (newFrame) {
            var frame = newFrame
            frame.origin.y += 15
            frame.size.height -= 2 * 5
            super.frame = frame
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
