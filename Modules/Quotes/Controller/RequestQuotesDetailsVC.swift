//
//  RequestQuotesDetailsVC.swift
//  Quotes
//
//  Created by Dambar Bista on 9/21/21.
//

import UIKit
import SwiftUI
import SnapKit
import TableViewReuseableCell

//struct RequestQuotesDetailsVCViewContainer: UIViewControllerRepresentable {

//    typealias UIViewControllerType = RequestQuotesDetailsVC
//
//    func makeUIViewController(context: Context) -> RequestQuotesDetailsVC {
//        return RequestQuotesDetailsVC()
//    }
//
//    func updateUIViewController(_ uiViewController: RequestQuotesDetailsVC, context: Context) { }
//
//}

//struct RequestQuotesDetailsVC_Preview: PreviewProvider {
//
//
//    static var previews: some View {
//        RequestQuotesDetailsVCViewContainer()
//    }
//}
//------------------------------------------------------------------------------------------------------------------------------



public class RequestQuotesDetailsVC: UIViewController {
    
    let navigationBar: UINavigationBar = {
        
        let navBarWidth = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 35, width: navBarWidth.width, height: 40))
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: nil)
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward.circle"), style: .plain, target: self, action: #selector(dismissSelf))
        let navItem = UINavigationItem(title: "Request Quotes Details")
        
        navItem.rightBarButtonItem = profileButton
        navItem.leftBarButtonItem = backButton
        navBar.setItems([navItem], animated: false)
        
        return navBar
    }()
    
     let requestQuotesDetailsTableView: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(cellType: EstimatedQuotesPriceTableViewCell.self)
        tableView.registerCell(cellType: ManageMyBillTableViewCell.self)
        
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        return tableView
    }()
    
    
    private let viewModel: RequestQuotesViewCofigurable
    static var isUpdatePaymentSectionCollapsed = false
    static var isMakeAPaymentSectionCollapsed = false
    static var isPaymentPlanSectionCollapsed = false
    
    init(viewModel: RequestQuotesViewCofigurable ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        requestQuotesDetailsTableView.delegate = self
        requestQuotesDetailsTableView.dataSource = self
        setupViews()
        addViews()
        setUpConstraints()
        
        
        // Do any additional setup after loading the view.
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        
    }
    
    private func addViews() {
        view.addSubview(navigationBar)
        view.addSubview(requestQuotesDetailsTableView)
        
    }
    
    private func setUpConstraints() {
        
        requestQuotesDetailsTableView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func presentChangePaymentPlanVC() {
        let changePaymentPlanVC = ChangePaymentPlanVC(viewModel: ChangePaymentPlanViewModel())
        
        changePaymentPlanVC.modalPresentationStyle = .fullScreen
        present(changePaymentPlanVC, animated: true, completion: nil)
    }
    
    private func setupAction(for editButton: UIButton, at indexPath: IndexPath) {
        let paperlessBillingRow = 2
        
        if indexPath.row == paperlessBillingRow {
            editButton.addTarget(self, action: #selector(presentChangePaymentPlanVC), for: .touchUpInside)
        }
    }
    
}

// MARK:- TableView Delegate and DataSource

extension RequestQuotesDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == Section.updatePaymentSection
            .rawValue, RequestQuotesDetailsVC.isUpdatePaymentSectionCollapsed == false {
            return 0
        }
        
        if section == Section.makeAPaymentSection
            .rawValue, RequestQuotesDetailsVC.isMakeAPaymentSectionCollapsed == false {
            return 0
        }
        
        if section == Section.paymentPlanSection
            .rawValue, RequestQuotesDetailsVC.isPaymentPlanSectionCollapsed == false {
            return 0
        }

        return viewModel.numberOfRowsPerSection(section: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let row = viewModel.row(for: indexPath) else { return UITableViewCell()}
        
        switch row {
        case .estimateQuotesPriceRow(_):
            let cell: EstimatedQuotesPriceTableViewCell = tableView.cell(for: indexPath)
            return cell
            /// I am putting same cell in below three rows
        case let .updatePaymentMethodsRow(cellViewModel):
            let cell: ManageMyBillTableViewCell = tableView.cell(for: indexPath)
            let editButton = cell.viewButton
            setupAction(for: editButton, at: indexPath)
            
            cell.configureCell(with: cellViewModel)
            return cell
            
        case let .makeAPayementRow(cellViewModel):
            let cell: ManageMyBillTableViewCell = tableView.cell(for: indexPath)
            cell.configureCell(with: cellViewModel)
            return cell
            
        case let .paymentPlanRow(cellViewModel):
            let cell: ManageMyBillTableViewCell = tableView.cell(for: indexPath)
            cell.configureCell(with: cellViewModel)
            return cell
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel.heightForRowAt(indexPath: indexPath))
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == Section.estimateQuotesPriceSection.rawValue {
            return 0
        } else {
            return 60
        }
    }
    
    
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: requestQuotesDetailsTableView.frame.width, height: 60))
            
            setUpViewForHeaderView(with: viewModel.titileForSections, and: headerView, section: section)
        
            return headerView
    }
    
    
    private func setUpViewForHeaderView(with headerTitle: [String], and headerView: UIView, section: Int) {
        /// properties
        let collapseButton = UIButton()
        let iconView = UIView()
        let iconImageView = UIImageView()
        let headerTitleLabel = UILabel()
        let sectionTitles = headerTitle
        
        ///Add Views
        headerView.addSubview(iconView)
        headerView.addSubview(headerTitleLabel)
        headerView.addSubview(collapseButton)
        iconView.addSubview(iconImageView)
        
        /// setUpViews
        headerTitleLabel.text = sectionTitles[section]
        headerTitleLabel.font = .boldSystemFont(ofSize: 18)
        headerTitleLabel.numberOfLines = 0
        iconImageView.image = UIImage(systemName: "calendar")
        collapseButton.setBackgroundImage(UIImage(systemName: "chevron.down"), for: .normal)
        iconView.backgroundColor = .systemGreen
        iconView.layer.cornerRadius = 20
        iconView.clipsToBounds = true
        
        if #available(iOS 14.0, *) {
            collapseButton.addAction(viewModel.actionForSectionButton(section: section, tableView: requestQuotesDetailsTableView), for: .touchUpInside)
        } else {
            // Fallback on earlier versions
        }
        
        /// Setup Constraint
        
        iconView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(30)
            $0.width.equalTo(40)
        }
        
        iconImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        headerTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.left.equalTo(iconView.snp.right).offset(10)
            $0.right.equalTo(collapseButton.snp.left).offset(-20)
            $0.height.equalTo(45)
        }
        
        collapseButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.left.equalTo(headerTitleLabel.snp.right).offset(20)
            $0.height.equalTo(10)
            $0.width.equalTo(20)
            
        }
    }
    
    
}
