//
//  ViewController.swift
//  PhotoGenerator
//
//  Created by Kshitij Ijari on 12/9/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
       
        
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Click for Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        

        return button
    }()
    
    let color:[UIColor] = [
            .systemRed,
            .systemYellow,
            .systemOrange,
            .systemPink,
            .systemPurple,
            .systemGreen
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.layer.borderWidth = 3
        imageView.center = view.center
       
        
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(onClick), for: .touchUpInside)
    }
    
    @objc func onClick(){
        getRandomPhoto()
        
        view.backgroundColor = color.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width - 60,
            height: 55)
        button.layer.cornerRadius = 15
    }

    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        
        let url = URL(string:urlString)!
        guard let data = try? Data(contentsOf:url) else{
            return
        }
        imageView.image = UIImage(data:data)
    }
}

