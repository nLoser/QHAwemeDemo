//
//  QHHomeViewController.swift
//  QHAwemeDemo
//
//  Created by Anakin chen on 2017/10/16.
//  Copyright © 2017年 AnakinChen Network Technology. All rights reserved.
//

import UIKit

class QHHomeViewController: QHBaseViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIGestureRecognizerDelegate, QHHomeCollectionViewCellDelegate {
    
    
    let homeCellIdentifier = "QHHomeCellIdentifier"
    
    var homeArray = [1, 2, 3, 4, 5, 6, 7, 8, 9,10]
    
    var detailVC: QHDetailsViewController? = QHDetailsViewController()
    
    @IBOutlet weak var mainCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //固定设置layut，或者通过UICollectionViewDelegateFlowLayout设置，这样可以动态调整
        if let layout = mainCV.collectionViewLayout as? UICollectionViewFlowLayout {
//            //设置cell的大小
//            layout.itemSize = self.view.frame.size
//            //滑动方向 默认方向是垂直
//            layout.scrollDirection = .vertical
            //每个Item之间最小的间距
            layout.minimumInteritemSpacing = 0
            //每行之间最小的间距
            layout.minimumLineSpacing = 0
        }
        
        if #available(iOS 11.0, *) {
            mainCV.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        
        p_setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Private
    
    func p_setup() {
//        p_addGesture()
    }
    
    func p_addGesture() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(QHHomeViewController.panAction(_:)))
        pan.delegate = self
        self.view.addGestureRecognizer(pan)
    }
    
    private func p_showDetails() {
        let vc = QHDetailsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: Public
    
    func showDetails() {
        p_showDetails()
    }
    
    //MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : QHHomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: homeCellIdentifier, for: indexPath) as! QHHomeCollectionViewCell
        cell.backgroundColor = UIColor.randomColor
        cell.titleL.text = "\(indexPath.row)"
        cell.delegate = self
        
        return cell
    }
    
    //MARK: UICollectionViewDelegate
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIScreen.main.bounds.size;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    //MARK: UIGestureRecognizerDelegate
    
    //MARK: QHHomeCollectionViewCellDelegate
    
    func showDetails(_ view: QHHomeCollectionViewCell) {
        p_showDetails()
    }
    
    //MARK: Action
    
    @objc func panAction(_ sender: UIPanGestureRecognizer) {
        print("\(sender)")
    }
}

extension UIColor {
    //返回随机颜色
    class var randomColor: UIColor {
        get {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}
