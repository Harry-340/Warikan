//
//  keisha ViewController.swift
//  Warikan
//
//  Created by Mishima Haruto on 1/11/25.
//

import UIKit

class keisha_ViewController: UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        // UIScrollView の設定
               scrollView.translatesAutoresizingMaskIntoConstraints = false
               view.addSubview(scrollView)
               NSLayoutConstraint.activate([
                   scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                   scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                   scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                   scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
               ])
               
               // コンテナの UIStackView 設定
               contentView.axis = .vertical
               contentView.spacing = 60
               contentView.translatesAutoresizingMaskIntoConstraints = false
               scrollView.addSubview(contentView)
               NSLayoutConstraint.activate([
                   contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                   contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                   contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                   contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                   contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
               ])
               
               // 初期行を追加
               addNewRow()
               
               // プラスボタンの追加
               let addButton = UIButton(type: .system)
               addButton.setTitle("+", for: .normal)
               addButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
               addButton.addTarget(self, action: #selector(addNewRow), for: .touchUpInside)
               contentView.addArrangedSubview(addButton)
    }
    
    @objc func addNewRow() {
           // 新しい行の UIStackView
        let rowStackView = UIStackView()
        rowStackView.axis = .horizontal
        rowStackView.spacing = 8
        rowStackView.alignment = .center
        rowStackView.distribution = .fill
        //rowStackView.backgroundColor = .
           
           // 名前を入力する UITextField
           let nameField = UITextField()
           nameField.placeholder = "名前"
           nameField.borderStyle = .roundedRect
           nameField.widthAnchor.constraint(equalToConstant: 120).isActive = true
           rowStackView.addArrangedSubview(nameField)
           
           // 数値ボタン（0, 1, 2, 3, opt.）
           let buttons = ["0", "1", "2", "3", "opt."]
           for title in buttons {
               let button = UIButton(type: .system)
               button.setTitle(title, for: .normal)
               button.backgroundColor = UIColor.systemBlue
               button.setTitleColor(.white, for: .normal)
               button.layer.cornerRadius = 20
               button.widthAnchor.constraint(equalToConstant: 40).isActive = true
               button.heightAnchor.constraint(equalToConstant: 40).isActive = true
               rowStackView.addArrangedSubview(button)
           }
           
           // 行をコンテンツビューに追加
           let index = max(0, contentView.arrangedSubviews.count - 1) // プラスボタンの手前に挿入
           contentView.insertArrangedSubview(rowStackView, at: index)
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
