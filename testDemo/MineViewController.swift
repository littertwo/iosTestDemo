//
//  MineViewController.swift
//  testDemo
//
//  Created by 威威孙 on 2017/6/1.
//  Copyright © 2017年 威威孙. All rights reserved.
//

import UIKit

class MineViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    
    
    lazy var tableView:UITableView = {
        let tableViewLazy = UITableView.init(frame: CGRect(x: CGFloat(0), y: CGFloat(-64), width: CGFloat(SCREENSIZE_WIDTH), height: CGFloat(SCREENSIZE_HEIGHT - 49)))
        
        tableViewLazy.delegate = self
        tableViewLazy.dataSource = self
        tableViewLazy.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        return tableViewLazy
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navgationHidden(hidden: true)
        self.tableView.delegate = self;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tableView.delegate = nil;
        MXNavigationBarManager.reStoreToSystemNavigationBar();
    }
    
    private func navgationHidden(hidden:Bool ){
        if hidden {
            self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage.init()
            self.navigationController?.navigationBar.isTranslucent = true
        }else{
            self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(named: "navigationbar_background"), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = nil
            self.navigationController?.navigationBar.isTranslucent = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MXNavigationBarManager.manager(with: self)
        MXNavigationBarManager.setBarColor(UIColor.white.withAlphaComponent(1))
        MXNavigationBarManager.setStatusBarStyle(UIStatusBarStyle.default)
        MXNavigationBarManager.setZeroAlphaOffset(-64)
        MXNavigationBarManager.setFullAlphaOffset(150)
        MXNavigationBarManager.setFullAlphaTintColor(UIColor.white)
        MXNavigationBarManager.setFullAlphaBarStyle(UIStatusBarStyle.lightContent)
        MXNavigationBarManager.setTintColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        
//        [MXNavigationBarManager setTintColor:[UIColor colorWithRed:0.15 green:0.15 blue:0.15 alpha:1]];
        
//        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.tableFooterView = UIView.init()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.tableView)
        
        // Do any additional setup after loading the view.
    }
    
    func setNavbarItem(){
        let leftBtn:UIButton = UIButton.init(type: UIButtonType.custom)
        leftBtn.frame = CGRect(x: 0, y: 0, width: 60, height: 35)
//        leftBtn.setImage(UIImage.init(named: <#T##String#>), for: <#T##UIControlState#>)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = UIColor.randomColour()
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.tableView {
            MXNavigationBarManager.changeAlpha(withCurrentOffset: scrollView.contentOffset.y)
//            [MXNavigationBarManager changeAlphaWithCurrentOffset:scrollView.contentOffset.y];
//            self.navgationHidden(hidden: false)
//            let contentOffset:CGFloat = scrollView.contentOffset.y
//            
//            if contentOffset >= 0 {
//                self.navigationController?.navigationBar.backgroundColor = UIColor.white.withAlphaComponent(contentOffset/CGFloat(150.0))
//            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
