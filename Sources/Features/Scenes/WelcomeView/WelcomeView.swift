//
//  WelcomeView.swift
//  Nearby
//
//  Created by Victor S Serpa on 10/12/24.
//

import Foundation
import UIKit

class WelcomeView: UIView{
    var didTapButton: (() -> Void)?
    
    private let logoImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let welcomeLabel: UILabel = {
       let label = UILabel()
        label.text = "Boas vindas ao Nearby!"
        label.font = Typography.titleXL
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "Tenha cupons de vantagens para usar em seus estabelecimentos favoritos."
        label.numberOfLines = 0
        label.font = Typography.textMD
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let subTextForTips: UILabel = {
        let label = UILabel()
        label.text = "Veja como funciona:"
        label.numberOfLines = 0
        label.font = Typography.textMD
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tipsStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.spacing = 24
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Começar", for: .normal)
        button.backgroundColor = Colors.greenBase
        button.setTitleColor(Colors.gray100, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = Typography.action
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        setupTips()
        addSubview(logoImageView)
        addSubview(welcomeLabel)
        addSubview(descriptionLabel)
        addSubview(subTextForTips)
        addSubview(tipsStackView)
        addSubview(startButton)
        
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
            logoImageView.heightAnchor.constraint(equalToConstant: 48),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            subTextForTips.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            subTextForTips.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            tipsStackView.topAnchor.constraint(equalTo: subTextForTips.bottomAnchor, constant: 24),
            tipsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            tipsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            startButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc private func didTap() {
        didTapButton?()
    }
    
    private func setupTips(){
        let firstTip = TipsView(icon: UIImage(named: "mapIcon") ?? UIImage(),
                                title: "Encontre Estabelecimentos",
                                description: "Veja Locais perto de você que sao parceiros Nearby")
        
        let secondTip = TipsView(icon: UIImage(named: "qrcode") ?? UIImage(),
                                 title: "Ative o cupom com QR Code",
                                 description: "Escaneie o código no estabelecimento para usar o benefício.")
        
        let thirdTip = TipsView(icon: UIImage(named: "ticket") ?? UIImage(),
                                title: "Garanta Vantagens perto de você",
                                description: "Ative cupons onde estiver, em diferentes tipos de estabelecimentos")
        
        tipsStackView.addArrangedSubview(firstTip)
        tipsStackView.addArrangedSubview(secondTip)
        tipsStackView.addArrangedSubview(thirdTip)
    }
}
