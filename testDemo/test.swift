//
//  test.swift
//  testDemo
//
//  Created by 威威孙 on 2017/5/15.
//  Copyright © 2017年 威威孙. All rights reserved.
//

import UIKit

/*
 如果Swift类想要被OC发现，必须继承自NSObject并且使用public标记，并且该类中想要被OC访问的方法也必须使用public标记，具体知识可以去看Swift的访问控制
 原因：Swift的代码对于OC来说是作为一个module存在的
 
 当然全局的Swift函数，我还没发现怎么在OC中访问，如果哪位清楚还请告诉一下，谢谢！
 
 
 1*1
 
 1*2 2*2
 
 1*3 2*3 3*3
 
 1*4 2*4 3*4 4*4
 .
 .
 .
 .
 1*9 2*9 3*9 4*9 5*9 6*9 7*9 8*9 9*9
 
 */

class ButtonTest: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let button:UIButton = UIButton.init()
//        button.addTarget(self, action: #selector(buttonClick(sender:)), for: UIControlEvents.touchUpInside)
//        self.view.addSubview(button)
        self.view.backgroundColor = UIColor.white
        self.rectBtn()
    }
    struct runTimeKey {
        static let nameKey:UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "name".hashValue)
        static let ageKey:UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "age".hashValue)
    }
    
    func rectBtn() {
        let rectBtn = UIButton(frame: CGRect(x: Int((SCREENSIZE_WIDTH-80)/2), y: 80, width: 80, height: 80))
        rectBtn.backgroundColor = UIColor.black
        
        self.view.addSubview(rectBtn)
        rectBtn.backgroundColor = UIColor.red
        //设置按钮可编辑
        rectBtn.clipsToBounds = true
        rectBtn.layer.cornerRadius = 40
        rectBtn.setImage(UIImage.init(named: "我的"), for: .normal)
        rectBtn.layer.borderColor = UIColor.black.cgColor
        rectBtn.layer.borderWidth = 2
        
        let name:NSString? = "Tom"
        let age:Int? = 18
        
        objc_setAssociatedObject(rectBtn, ButtonTest.runTimeKey.nameKey, name, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        objc_setAssociatedObject(rectBtn, ButtonTest.runTimeKey.ageKey, age, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        rectBtn.addTarget(self, action: #selector(touchActions(sender:)), for: .touchUpInside)
        
    }
    
    func touchActions(sender:UIButton){
        let name:NSString = objc_getAssociatedObject(sender, ButtonTest.runTimeKey.nameKey) as! NSString
        let weight:Int = objc_getAssociatedObject(sender, ButtonTest.runTimeKey.ageKey) as! Int
        print((name) ,(weight) )
    }
    
    func buttonClick(sender:UIButton) {
        print("点击了button")
    }
}


public class Test: NSObject {
    public func log() {
        print("这是Swift的方法")
    }
    
    
    public func test2() -> String {
        print("第二个测试方法")
        return ""
    }
    
    func nine()  {
        for i in 1...9 {
            for j in 1...0 {
                print("\(i) * \(j) = \(i*j)")
                if j == 9 {
                    print("/n")
                }
            }
        }
    }
}

public func globalLog() {
    print("这是Swift全局的log方法")
}
