import UIKit

final class ProfileViewController: UIViewController {
    
    private let userName = UILabel()
    private let userLogin = UILabel()
    private let userDescription = UILabel()
    private let userImage = UIImageView()
    private let logoutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUserInfo()
        createUserImage()
        createLogoutButton()
        createConstraits()
    }
    
    private func createUserInfo() {
        userName.text = "Екатерина Новикова"
        userName.font = UIFont(name: "Yandex Sans Display Bold", size: 23)
        userName.textColor = .white
        
        userLogin.text = "@ekaterina_nov"
        userLogin.textColor = UIColor.ypGray
        userLogin.font = UIFont(name: "Yandex Sans Display", size: 13)
        
        userDescription.text = "Hello, world!"
        userDescription.font = UIFont(name: "Yandex Sans Display", size: 13)
        userDescription.textColor = .white
        
        userName.translatesAutoresizingMaskIntoConstraints = false
        userLogin.translatesAutoresizingMaskIntoConstraints = false
        userDescription.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(userName)
        view.addSubview(userLogin)
        view.addSubview(userDescription)
    }
    
    private func createUserImage() {
        userImage.image = UIImage(named: "avatar")
        userImage.tintColor = .gray
        
        userImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userImage)
    }
    
    private func createLogoutButton() {
        logoutButton.setBackgroundImage(UIImage(named: "logout_button"), for: .normal)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutButton)
    }
    
    private func createConstraits() {
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 8),
            userName.leadingAnchor.constraint(equalTo: userImage.leadingAnchor),
            userLogin.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 8),
            userLogin.leadingAnchor.constraint(equalTo: userImage.leadingAnchor),
            userDescription.topAnchor.constraint(equalTo: userLogin.bottomAnchor, constant: 8),
            userDescription.leadingAnchor.constraint(equalTo: userImage.leadingAnchor),
            
            userImage.heightAnchor.constraint(equalToConstant: 70),
            userImage.widthAnchor.constraint(equalToConstant: 70),
            userImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 42),
            userImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            logoutButton.centerYAnchor.constraint(equalTo: userImage.centerYAnchor),
            logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
    }
}
