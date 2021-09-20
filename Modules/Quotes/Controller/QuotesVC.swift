//
//  QuotesVC.swift
//  Quotes
//
//  Created by Dambar Bista on 9/6/21.
//

import UIKit
import SnapKit
import Profile
import PopUp
import TableViewReuseableCell

public class QuotesVC: UIViewController {
   
    let navigationBar: UINavigationBar = {
        
        let navBarWidth = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 25, width: navBarWidth.width, height: 40))
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(navigateToProfileVC))
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward.circle"), style: .plain, target: self, action: nil)
        let navItem = UINavigationItem(title: "QUOTES")
        
        navItem.rightBarButtonItem = profileButton
        navItem.leftBarButtonItem = backButton
        navBar.setItems([navItem], animated: false)
        
        return navBar
    }()
    
    private let quotesTableViewCell: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(cellType: MyQuotesTableViewCell.self)
        tableView.registerCell(cellType: RequestQuoteTableViewCell.self)
        tableView.registerCell(cellType: QuotesDetailsTableViewCell.self)
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
    
    private let viewModel: QuotesViewConfigurable

    public init(viewModel: QuotesViewConfigurable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        addViews()
        setUpConstraints()
        quotesTableViewCell.delegate = self
        quotesTableViewCell.dataSource = self
        /// Receiving notificaton to perform action: action is to pop up QuotesDetailsVC to display more details content: action from:  QuotesDetailsTableViewCell
        NotificationCenter.default.addObserver(self, selector: #selector(popUpShowMoreDetails(_:)), name: Notification.Name("popUpQuotesDetailsVC"), object: nil)
    }
    
  
    private func addViews() {
        
        self.view.addSubview(navigationBar)
        self.view.addSubview(quotesTableViewCell)
    }
    
    
    private func setUpConstraints() {
        
        quotesTableViewCell.snp.makeConstraints { make in
            
            make.top.equalTo(navigationBar.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    /// this method will pop up showMoreDetailsVC to display more content
    /// After receiving  notification from QuotesDetailsTableViewCell method called showMoredetails()
    @objc private func popUpShowMoreDetails(_ notification: Notification) {
        
        let showMoreDetailsVC = PopupVC(viewModel: HowItworksViewModel())
        
        present(showMoreDetailsVC, animated: false, completion: nil)
    }
    
    
    @objc private func navigateToProfileVC() {
        
        let profileVC = ProfileVC()
        profileVC.modalPresentationStyle = .fullScreen
        present(profileVC, animated: true)
    }
    
}


extension QuotesVC: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowPerSection(section: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        guard let  row = viewModel.row(for: indexPath) else {return UITableViewCell()}
        
        switch row {
        case let .myQuotesRow(cellViewModel):
            let cell: MyQuotesTableViewCell = tableView.cell(for: indexPath)
            cell.configureCell(with: cellViewModel)
            return cell
            
        case .requestQuoteRow(_):
            let cell: RequestQuoteTableViewCell = tableView.cell(for: indexPath)
            return cell
            
        case .quotesDetailsRow(_):
            let cell: QuotesDetailsTableViewCell = tableView.cell(for: indexPath)
            return cell
        }
    }
    
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel.heightForRowAt(indexPath: indexPath))
    }
    
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionTitles = viewModel.titileForSections
        let headerTitleWidth = self.view.frame.width - 20
        let headerTitleLabel = UILabel(frame: CGRect(x: 0, y: 5, width: headerTitleWidth, height: 20))
        headerTitleLabel.text = sectionTitles[section]
        headerTitleLabel.font = .systemFont(ofSize: 20)
        headerTitleLabel.textAlignment = .center

        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: headerTitleWidth, height: 40))
        headerView.addSubview(headerTitleLabel)

        return headerView
    }
    
}
