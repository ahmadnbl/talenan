//
//  GettingWindowUIKitViewController.swift
//  Talenan
//
//  Created by Ahmad Nabili on 13/06/21.
//

import UIKit

final class GettingWindowUIKitViewController: UIViewController {
    let label: UILabel = {
        let label = UILabel()
        label.text = "Idle..."
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(primaryAction: UIAction(handler: { [weak self] _ in
            self?.showAlert()
        }))
        button.setTitle("Tap Me!", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "GeWindow (UIKit)"
        
        view.addSubview(label)
        view.addSubview(button)
        view.backgroundColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16).isActive = true
        button.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: 16).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        parent?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(closeHandler))
    }
    
    @objc
    private func closeHandler() {
        dismiss(animated: true, completion: nil)
    }
    
    private func showAlert() {
        label.text = "Prepare for launching..."
        DispatchQueue.main.asyncAfter(deadline: .now()+3) { [weak self] in
            guard let topVc = UIApplication.shared.keyWindow?.rootViewController else { return }
            
            let alert = UIAlertController(title: "What", message: "Happened there?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            topVc.present(alert, animated: true, completion: nil)
            
            self?.label.text = "Launched!"
        }
    }
}

