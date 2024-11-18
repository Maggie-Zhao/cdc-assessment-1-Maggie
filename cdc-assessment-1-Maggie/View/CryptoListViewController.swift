//
//  ViewController.swift
//  cdc-assessment-1-Maggie
//
//  Created by 赵明慧 on 2024/11/16.
//

import UIKit

class CryptoListViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var viewModel: CryptoViewModel = CryptoViewModel(cryptoList: CryptoModel())
    var dataArray: [CryptoDetail]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(loadCryptoList), for: .touchUpInside)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
        tableView.register(UINib(nibName: "CryptoTableViewCell", bundle: nil), forCellReuseIdentifier: "Identifier")
    }
    
    @objc func loadCryptoList() {
        viewModel.getCryptoList()
        self.dataArray = viewModel.cryptoList?.data
        if dataArray?.count ?? 0 > 0 {
            tableView.isHidden = false
            self.tableView.reloadData()
        } else {
            showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Load Crypto With Error", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { action in
            print("Alert Action: \(action.title!)")
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    func showNewView() {
        let vc = self
        let detailViewController = CryptoDetailViewController()
        vc.present(detailViewController, animated: true)
    }
}

extension CryptoListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = dataArray, list.count > 0 {
            return list.count
        } else {
            return 0
        }
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Identifier", for: indexPath) as! CryptoTableViewCell
        if let list = dataArray, list.count > 0 {
            let data = list[indexPath.row]
            cell.title?.text = data.title
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let totalHeight: Double = tableView.frame.size.height
        if let listCount = dataArray?.count {
            let height = totalHeight / Double(listCount)
            return CGFloat(height)
        } else {
            return 74
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // 处理点击事件
        showNewView()
    }
}

class CryptoDetailViewController: UIViewController {
    // 新页面的实现
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.text = "Hello, everyone!"
        label.frame = CGRect(x: 50, y: 50, width: 200, height: 20)
        
        label.textColor = .black
        label.backgroundColor = .white
        
        label.textAlignment = .center
        
        self.view.addSubview(label)
        self.view.backgroundColor = .white
    }
}

