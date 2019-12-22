//
//  HomePageViewController.swift
//  UITestDemo
//
//  Created by ma c on 2019/12/22.
//  Copyright © 2019 ma c. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    var topHeight : CGFloat = 158.0
    
    let couponImage : UIImage! = UIImage(named: "TestImage")
    
    lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView.init(frame: CGRect(x: 0, y: topHeight, width: couponImage.size.width, height: 200), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(CouponCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.alwaysBounceVertical = true
        
        return collectionView
    }()
    
    lazy var button : UIButton = {
       
        let button = UIButton.init(frame: CGRect(x: 50, y: 50, width: 70, height: 30))
        button.setTitle("弹窗", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(popupTest), for: .touchUpInside)
        
        return button
        
    }()
    
    lazy var imageView: UIImageView = {
        
        var image = UIImage(named: "TestImage")
        topHeight = 158.0
        print(image!.size)
        image = image?.resizableImage(withCapInsets: UIEdgeInsets(top: 158, left: 0, bottom: 20, right: 0), resizingMode: .stretch)
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: image!.size.width, height: 400))
        imageView.image = image
//        imageView.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
        imageView.center = self.view.center
        imageView.isUserInteractionEnabled = true
        
        let bottomImage = UIImage(named: "TestImageBottom")
        let bottomImageView = UIImageView.init(frame: CGRect(x: 0, y: imageView.bounds.height - bottomImage!.size.height, width: imageView.bounds.width, height: bottomImage!.size.height))
        bottomImageView.image = bottomImage
        
        imageView.addSubview(collectionView)
        imageView.addSubview(bottomImageView)
        
        
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemOrange
        
        self.view.addSubview(button)
        self.view.addSubview(imageView)
        
        imageView.isHidden = true
        
    }
    
    @objc private func popupTest() {
        
//        PNProgressHUD.present(with: "测试测试测试测试", presentType: .fromTop, font: nil, backgroundColor: nil, textColor: nil, in: self.view)
//        PNProgressHUD.present(with: "测试测试测试测试", presentType: .popup, font: nil, backgroundColor: nil, textColor: nil, in: self.view)
        
        imageView.isHidden = false
        imageView.alpha = 0.0
        
        UIView.animate(withDuration: 0.2, animations: {
            
            self.imageView.alpha = 1.0
        }) { (completed) in
            
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        UIView.animate(withDuration: 0.2, animations: {
            
            self.imageView.alpha = 0.0
        }) { (completed) in
            
            self.imageView.isHidden = false
        }
    }
//    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomePageViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        .init(width: 285.0, height: 80.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        .init(top: 15.0, left: 0, bottom: 0, right: 0)
    }
}
