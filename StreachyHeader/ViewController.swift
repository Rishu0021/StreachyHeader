//
//  ViewController.swift
//  StreachyHeader
//
//  Created by Rishu Gupta on 01/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageViewHeader: UIImageView!
    @IBOutlet weak var viewTopCorners: UIView!
    
    // MARK:- Variables
    private var headerView : UIView!
    private let headerheight : CGFloat = 380
    
    let data: String = """
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in nisl nisi scelerisque eu. Viverra mauris in aliquam sem fringilla ut morbi tincidunt. Urna nec tincidunt praesent semper feugiat nibh sed pulvinar proin. Tortor dignissim convallis aenean et. Scelerisque viverra mauris in aliquam sem fringilla ut. Aliquam sem fringilla ut morbi tincidunt augue. Elementum pulvinar etiam non quam lacus suspendisse. Mattis molestie a iaculis at erat pellentesque adipiscing commodo. Vulputate mi sit amet mauris commodo quis. Faucibus a pellentesque sit amet porttitor. Fermentum dui faucibus in ornare quam viverra orci sagittis. Faucibus purus in massa tempor nec. Consectetur a erat nam at lectus urna duis. Varius vel pharetra vel turpis nunc eget lorem. Quis varius quam quisque id. Id aliquet lectus proin nibh nisl condimentum. Sit amet risus nullam eget felis eget nunc.

                        Sit amet nisl suscipit adipiscing bibendum est ultricies. Purus ut faucibus pulvinar elementum integer enim neque. Turpis massa sed elementum tempus egestas sed sed risus pretium. Donec et odio pellentesque diam. Lacus laoreet non curabitur gravida arcu. Lorem sed risus ultricies tristique nulla aliquet. Integer malesuada nunc vel risus commodo viverra maecenas accumsan. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Venenatis cras sed felis eget. Quam nulla porttitor massa id neque. Tristique senectus et netus et.

                        Sociis natoque penatibus et magnis dis parturient montes. Fringilla urna porttitor rhoncus dolor. Praesent tristique magna sit amet purus. Eget mi proin sed libero enim sed. Ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia. Velit aliquet sagittis id consectetur purus ut faucibus. Amet consectetur adipiscing elit duis tristique sollicitudin nibh. Arcu dictum varius duis at consectetur lorem donec. Nulla facilisi morbi tempus iaculis urna id volutpat. Scelerisque varius morbi enim nunc faucibus a. Tortor condimentum lacinia quis vel eros donec ac odio tempor. Senectus et netus et malesuada fames ac turpis egestas. Porta lorem mollis aliquam ut porttitor leo a diam sollicitudin. Neque sodales ut etiam sit. Maecenas ultricies mi eget mauris. Tristique senectus et netus et malesuada fames ac turpis egestas.

                        Aliquam faucibus purus in massa tempor nec feugiat nisl pretium. Netus et malesuada fames ac turpis egestas sed. Ante metus dictum at tempor commodo ullamcorper a lacus. Lobortis elementum nibh tellus molestie nunc non blandit massa. Eget mauris pharetra et ultrices neque ornare aenean euismod. Ullamcorper a lacus vestibulum sed arcu. Turpis cursus in hac habitasse platea. Feugiat in fermentum posuere urna nec. Massa tincidunt dui ut ornare lectus sit amet est placerat. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt lobortis. Venenatis cras sed felis eget. Orci ac auctor augue mauris augue.

                        Risus pretium quam vulputate dignissim suspendisse. Quam viverra orci sagittis eu volutpat. Feugiat sed lectus vestibulum mattis ullamcorper velit sed. Cursus mattis molestie a iaculis at erat. Faucibus nisl tincidunt eget nullam non nisi est. Quis eleifend quam adipiscing vitae proin sagittis nisl. Facilisis gravida neque convallis a cras semper auctor. Sodales ut eu sem integer. Vitae congue mauris rhoncus aenean vel elit. Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi.
                            

                    """
    
    // MARK:- View LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.resetNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setupHeaderView()
    }
    
    deinit {
        UIApplication.shared.resetStatusBar()
    }
    
    
    // MARK:- Private Methods
    private func initialSetup() {
        self.title = "Streachy Header"
        
        self.setupTableView()
        self.updateView()
        let shadowColor = UIColor.init(red: 0.65, green: 0.65, blue: 0.65, alpha: 0.50)
        self.viewTopCorners.addShadow(offset: CGSize(width: 0, height: -1), color: shadowColor, opacity: 1, radius: 0.5)
        
    }
    
    private func resetNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.barStyle = .default
    }
    private func updateView() {
        tableView.backgroundColor = UIColor.white
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.rowHeight = UITableView.automaticDimension
        tableView.addSubview(headerView)
                
        let newheight = (headerheight - 148)
        tableView.contentInset = UIEdgeInsets(top: newheight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -newheight)
        
        self.setupHeaderView()
    }
    private func setupHeaderView() {
        let newheight = (headerheight - 148)
        var headerFrame = CGRect(x: 0, y: -newheight, width: tableView.bounds.width, height: headerheight)
        if tableView.contentOffset.y < newheight {
            headerFrame.origin.y = tableView.contentOffset.y
            headerFrame.size.height = -tableView.contentOffset.y + 30
        }
        headerView.frame = headerFrame
    }
    
    
}

extension ViewController {
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tableView.decelerationRate = UIScrollView.DecelerationRate.fast
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.setupHeaderView()
        
        var offset = scrollView.contentOffset.y / 150
        if offset > -0.5 {
            UIView.animate(withDuration: 0.2, animations: {
                offset = 1
                let color = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
                self.navigationController?.navigationBar.tintColor = .black
                self.navigationController?.navigationBar.backgroundColor = color
                UIApplication.shared.statusBarView?.backgroundColor = color
                
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
                self.navigationController?.navigationBar.barStyle = .default
            })
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                let color = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
                self.navigationController?.navigationBar.tintColor = UIColor.white
                self.navigationController?.navigationBar.backgroundColor = color
                UIApplication.shared.statusBarView?.backgroundColor = color
                
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                self.navigationController?.navigationBar.barStyle = .black
            })
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 50
        //self.tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: "DescriptionTableViewCell")
        self.reloadTableView()
    }
    private func reloadTableView() {
        self.tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as! DescriptionTableViewCell
        cell.setupCell(self.data)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
