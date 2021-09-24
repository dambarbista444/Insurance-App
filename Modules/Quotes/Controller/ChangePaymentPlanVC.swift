//
//  ChangePaymentPlanVC.swift
//  Quotes
//
//  Created by Dambar Bista on 9/22/21.
//

import UIKit


public class ChangePaymentPlanVC: UIViewController {
    
    let navigationBar: UINavigationBar = {
        
        let navBarWidth = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 35, width: navBarWidth.width, height: 40))
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: nil)

        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissSelf))
        
        let navItem = UINavigationItem(title: "Change Payment Plan")
        
        navItem.rightBarButtonItem = profileButton
        navItem.leftBarButtonItem = cancelButton
        navBar.setItems([navItem], animated: false)
        
        return navBar
    }()
    
    let paymentPlanTableView: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(cellType: SelectNewPaymentPlanTableViewCell.self)
        tableView.registerCell(cellType: SchedulePaymentsTableViewCell.self)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private let viewModel: ChangePaymentPlanViewConfigurable
    var isCheckMarked: Bool = true
    
     public init(viewModel: ChangePaymentPlanViewConfigurable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        paymentPlanTableView.delegate = self
        paymentPlanTableView.dataSource = self
        
        setupViews()
        addViews()
        setUpConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        
    }
    
    private func addViews() {
        view.addSubview(navigationBar)
        view.addSubview(paymentPlanTableView)
        
    }
    
    private func setUpConstraints() {
        
        paymentPlanTableView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}


// MARK:- TableView Delegate And DataSource

extension ChangePaymentPlanVC: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsPerSection(section: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let  row = viewModel.row(for: indexPath) else { return UITableViewCell()}
        
        switch row {
        case .newPaymentPlanRow(_):
            let cell: SelectNewPaymentPlanTableViewCell = tableView.cell(for: indexPath)
            cell.textLabel?.text = viewModel.paymentPlanItems[indexPath.row]
            
            if indexPath.row == 5, isCheckMarked == true {
                cell.accessoryType = .checkmark
            }
            
            return cell
            
        case let .schedulePaymentRow(cellViewModel):
            let cell: SchedulePaymentsTableViewCell = tableView.cell(for: indexPath)
            cell.configureCell(with: cellViewModel)
            return cell
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel.heightForRowAt(indexPath: indexPath))
    }
    
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerTitleLabel = UILabel(frame: CGRect(x: 20, y: 5, width: paymentPlanTableView.frame.width, height: 40))
        headerTitleLabel.text = viewModel.titileForSections[section]
        headerTitleLabel.font = .boldSystemFont(ofSize: 18)
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: paymentPlanTableView.frame.width, height: 40))
        headerView.addSubview(headerTitleLabel)
        
        return headerView
    }
    
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(40)
    }
    
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 {
            return 0
        } else {
            return 80
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
        
        if isCheckMarked == true {
            isCheckMarked = false
            tableView.reloadSections(IndexSet(integer: 0), with: .none)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
   
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let saveButton = UIButton()
        saveButton.backgroundColor = .black
        saveButton.layer.cornerRadius = 15
        saveButton.setTitle("Save", for: .normal)
    
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: paymentPlanTableView.frame.width, height: 80))
        footerView.addSubview(saveButton)
        
        /// SetupButtonView
        saveButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(100)
            $0.top.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        return footerView
    }
    
    
}
