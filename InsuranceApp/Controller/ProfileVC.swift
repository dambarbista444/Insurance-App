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
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let selectStateLabel = UILabel()
    let stateDropDownButton = UIButton()
    var isStateSectionOpen: Bool = true
    var personResult: PersonResult?
    var states = [String]()
    var profileNetworkManager = PersonModelNetworkManager()
    var stateNetworkManager = StateNetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addViews()
        setUPConstrints()
        tableView.delegate = self
        tableView.dataSource = self
        selectStateLabel.text = "Select States"
        configurStateDropDownAction(sender: stateDropDownButton)
        _ =  profileNetworkManager.fetchPersonDetails(completionHandler: ProfileCardAPIHandler())
        _ = stateNetworkManager.fetchStateData(completaion: stateAPIDataHandler())
    }
    
    /// Passing  API data for profile card
    private func ProfileCardAPIHandler() -> (PersonResult) -> Void {
        let handler = { (result: PersonResult) in
            DispatchQueue.main.async { [self] in
                personResult = result
                tableView.reloadData()
            }
        }
        return handler
    }
    
    /// Passing  API data for states dection
    private func stateAPIDataHandler() -> ([String]) -> Void {
        let handler = { (result: [String]) in
            DispatchQueue.main.async { [self] in
                states = result
                tableView.reloadData()
            }
        }
        return handler
    }
    
    
    private func addViews() {
        self.view.addSubview(navigationBar)
        self.view.addSubview(tableView)
        self.view.addSubview(saveButton)
    }
    
    
    private func configurStateDropDownAction(sender: UIButton) {
        
        stateDropDownButton.addTarget(self, action: #selector(openAndCollapseStateSection), for: .touchUpInside)
    }
    
    /// This method is for open and collapse the state and country sections
    @objc private func openAndCollapseStateSection() {
        
        isStateSectionOpen = !isStateSectionOpen
        tableView.reloadSections(IndexSet(integer: 2), with: .automatic)
    }
    
    /// This method willl navigate to login page
    @objc  private func navigateToLoginVC() {
        print("back")
    }
    
    
    /// This method will save the edit profile items
    @objc private func saveProfileItems() {
        
    }
    
    
    private func getPersonFullName() -> String {
        var fullName = ""
        if let firstName = personResult?.name.first {
            if let lastName = personResult?.name.last {
                fullName =  firstName + lastName
            }
        }
        return fullName
    }
    
    
    /// Getting Profile Image from json url
    private func getProfileImage() -> UIImage {
        
        var profileImage = UIImage()
        let picUrl =  personResult?.picture.medium
        
        if let urlImage = URL(string: picUrl!) {
            if let imageData = try? Data(contentsOf: urlImage) {
                profileImage = UIImage(data: imageData)!
            }
        }
        return profileImage
    }
    
}/// this is a last line of ProfileVC


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
            return isStateSectionOpen ? 0 : states.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let personResult = personResult else {return UITableViewCell()}
        
        if indexPath.section == ProfileSections.profileCardSection{
            let profileCell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileCardCell
            
            profileCell.emailLabel.text = personResult.email
            profileCell.nameLabel.text =  getPersonFullName()
            profileCell.userIdlabel.text = personResult.id.value
            profileCell.phoneNumberLabel.text = personResult.phone
            profileCell.profileImageView.image = getProfileImage()
            
            return profileCell
            
        } else if indexPath.section == ProfileSections.editProfile {
            
            let profileEditCell = tableView.dequeueReusableCell(withIdentifier: "profileEditCell", for: indexPath) as! ProfileEditCell
            profileEditCell.personalInfoNames.text = ProfileModelsData.personalInfos[indexPath.row].personalInfo
            profileEditCell.personalInfoTextField.placeholder = ProfileModelsData.personalInfos[indexPath.row].personalInfo
            
            
            switch indexPath.row {
            case ProfileEditRow.phone:
                profileEditCell.personalInfoTextField.text = personResult.phone
                
            case ProfileEditRow.email:
                profileEditCell.personalInfoTextField.text = personResult.email
                
            case ProfileEditRow.street:
                profileEditCell.personalInfoTextField.text = personResult.location.street.name
                
            case ProfileEditRow.aptOrSuite:
                profileEditCell.personalInfoTextField.text = "444"
                
            case ProfileEditRow.city:
                profileEditCell.personalInfoTextField.text = personResult.location.city
                
            case ProfileEditRow.zip:
                profileEditCell.personalInfoTextField.text = (String(describing: personResult.location.postcode))
                
            case ProfileEditRow.country:
                profileEditCell.personalInfoTextField.text = personResult.location.country
                
            default:
                break
            }
            
            return profileEditCell
            
        } else {
            
            let stateCell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath) as! StatesCell
            stateCell.statesNameLabel.text = states[indexPath.row]
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
        
        if indexPath.section == ProfileSections.states {
            selectStateLabel.text = states[indexPath.row]
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
            
            return  createSectionViewsForStates(sectionTitle: "State", sectionView: stateView, selectStateLabel: selectStateLabel, dropDownBtn: stateDropDownButton)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

