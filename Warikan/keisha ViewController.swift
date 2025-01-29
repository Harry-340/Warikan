//
//  keisha ViewController.swift
//  Warikan
//
//  Created by Mishima Haruto on 1/11/25.
//

import UIKit
import RealmSwift

class keisha_ViewController: UIViewController, UITableViewDataSource, CustomCellDelegate {
    
    
    
   
    let realm = try! Realm()
    var memo: [Memo] = []
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "itemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        
        memo = readItems()
       
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! itemTableViewCell
        cell.delegate = self
        cell.configure(memo: memo[indexPath.row])
        return cell
    }
    
    func readItems() -> [Memo]{
        return Array (realm.objects(Memo.self))
    }
    
    @IBAction func plus(){
        let newMemo = Memo()
        try!realm.write{
            realm.add(newMemo)
        }
        memo = readItems()
        tableView.reloadData()
    }
    func didUpdateMemo(_ cell: itemTableViewCell, name: String?, flag: Int?, optAmount: Int?) {
        //print("hello")
        guard let targetMemo = cell.memo else { return }
       try! realm.write {
            targetMemo.name         = name ?? ""
            targetMemo.flag         = flag ?? 0
            targetMemo.optionAmount = optAmount ?? 0
        }
        memo = readItems()
        tableView.reloadData()
    }
    
    func didTapOptButton(_ cell: itemTableViewCell) {
        print("tapped")
        let alert = UIAlertController(title: "Input", message: "Enter some text", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.keyboardType = .numberPad
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default){
            [weak self, weak alert] _ in guard
            let self      = self,
            let textField = alert?.textFields?.first,
            let text      = textField.text,
            let amount    = Int(text)
            else { return }
            
            cell.optAmount = amount
            
            if let targetMemo = cell.memo {
                try! self.realm.write {
                    targetMemo.optionAmount = amount
                }
                self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
        
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
