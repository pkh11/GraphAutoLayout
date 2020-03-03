//
//  ViewController.swift
//  Graph_AutoLayout
//
//  Created by 박균호 on 2020/03/02.
//  Copyright © 2020 박균호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var graph1Height: NSLayoutConstraint!
    @IBOutlet weak var graph2Height: NSLayoutConstraint!
    @IBOutlet weak var graph3Height: NSLayoutConstraint!
    @IBOutlet weak var graph4Height: NSLayoutConstraint!
    @IBOutlet weak var graph5Height: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func style1(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.graph1Height = self.graph1Height.changeMultiplier(value: 0.95)
            self.graph2Height = self.graph2Height.changeMultiplier(value: 0.85)
            self.graph3Height = self.graph3Height.changeMultiplier(value: 0.75)
            self.graph4Height = self.graph4Height.changeMultiplier(value: 0.65)
            self.graph5Height = self.graph5Height.changeMultiplier(value: 0.55)
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func style2(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.graph1Height = self.graph1Height.changeMultiplier(value: 0.51)
            self.graph2Height = self.graph2Height.changeMultiplier(value: 0.67)
            self.graph3Height = self.graph3Height.changeMultiplier(value: 0.73)
            self.graph4Height = self.graph4Height.changeMultiplier(value: 0.82)
            self.graph5Height = self.graph5Height.changeMultiplier(value: 0.91)
            self.view.layoutIfNeeded()
        }
    }
}
extension NSLayoutConstraint {
    // constraint 새로 설정
    func changeMultiplier(value: CGFloat) -> NSLayoutConstraint{
        
        // 갖고있는 constraint 설정 초기화
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint.init(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: value, constant: self.constant)
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        // constraint 새로 설정
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
}
