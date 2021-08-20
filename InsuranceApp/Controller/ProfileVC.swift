//
//  ProfileVC.swift
//  iOSTrainingProject2 - Dambar
//
//  Created by Dambar Bista on 8/16/21.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    let navigationBar: UINavigationBar = {
        
        let navBarWidth = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: navBarWidth.width, height: 100))
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward.circle"), style: .plain, target: nil, action:  #selector(navigateToLoginVC))
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: nil, action: nil)
        let navItem = UINavigationItem(title: "PROFILE")
        navItem.leftBarButtonItem = backButton
        navItem.rightBarButtonItem = profileButton
        navBar.setItems([navItem], animated: false)
        
        return navBar
    }()
    
    
    var tableView: UITableView = {
        let table = UITableView()
        table.register(ProfileCardCell.self, forCellReuseIdentifier: "profileCell")
        table.register(ProfileEditCell.self, forCellReuseIdentifier: "profileEditCell")
        table.register(StatesCell.self, forCellReuseIdentifier: "stateCell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("SAVE", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(saveProfileItems), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let selectStateLabel = UILabel()
    let stateDropDownButton = UIButton()
    
    
    let selectCountryLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Country"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var isStateSectionOpen: Bool = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addViews()
        setUPConstrints()
        tableView.delegate = self
        tableView.dataSource = self
        selectStateLabel.text = "Select States"
        configureSectionsButtonAction()
    }
    
    
    private func addViews() {
        self.view.addSubview(navigationBar)
        self.view.addSubview(tableView)
        self.view.addSubview(saveButton)
    }
    
    
    private func configureSectionsButtonAction() {
        
        stateDropDownButton.addTarget(self, action: #selector(openAndCollapseStateSection), for: .touchUpInside)
    }
    
    /// This method is for open and collapse the state and country sections
    @objc private func openAndCollapseStateSection() {
       
        isStateSectionOpen = !isStateSectionOpen
        tableView.beginUpdates()
        tableView.reloadSections(IndexSet(integer: 2), with: .fade)
        tableView.endUpdates()
    }
    
    /// This method willl navigate to login page
    @objc  private func navigateToLoginVC() {
        
        print("back")
    }
    
    
    /// This method will save the edit profile items
    @objc private func saveProfileItems() {
        
    }

}


extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == ProfileSections.profileCardSection {
            return 1
        } else if section == ProfileSections.editProfile {
            return ProfileModelsData.personalInfos.count
        
        } else  {
            return isStateSectionOpen ? 0 : 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == ProfileSections.profileCardSection{
            let profileCell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileCardCell
            return profileCell
            
        } else if indexPath.section == ProfileSections.editProfile {
            
            let profileEditCell = tableView.dequeueReusableCell(withIdentifier: "profileEditCell", for: indexPath) as! ProfileEditCell
            profileEditCell.personalInfoNames.text = ProfileModelsData.personalInfos[indexPath.row].personalInfo
            profileEditCell.personalInfoTextField.placeholder = ProfileModelsData.personalInfos[indexPath.row].personalInfo
            return profileEditCell
        } else {
            
            let stateCell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath) as! StatesCell
            stateCell.statesNameLabel.text = ProfileEditItems.states[indexPath.row]
            return stateCell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == ProfileSections.profileCardSection  {
            return 160
        } else {
            return 50
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 2 {
            selectStateLabel.text = ProfileEditItems.states[indexPath.row]
        }
        tableView.reloadData()
    }
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == ProfileSections.profileCardSection  {
            
            return createSectionViewForProfileCardAndProfileEdit(title: "PORFILE & SETTING")
        } else if section == ProfileSections.editProfile   {
            
            return createSectionViewForProfileCardAndProfileEdit(title: "EDIT INFO")
        } else {
            let stateView = UIView()
           
            return  createSectionViewsForStatesAndCountry(sectionTitle: "State", sectionView: stateView, selectLabel: selectStateLabel, dropDownBtn: stateDropDownButton)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    
    
    
}
