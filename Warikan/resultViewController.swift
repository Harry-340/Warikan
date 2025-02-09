//
//  result ViewController.swift
//  Warikan
//
//  Created by Mishima Haruto on 1/12/25.
//

import UIKit
import RealmSwift

class resultViewController: UIViewController, UITableViewDataSource {
   
    @IBOutlet var tableView: UITableView!
    @IBOutlet var finish : UIButton!
    var items: [Memo] = []

    let realm = try! Realm()
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.register(UINib(nibName: "finalTableViewCell", bundle: nil), forCellReuseIdentifier: "finalCell")
        // Do any additional setup after loading the view.
        items = readItems()
        finish.layer.cornerRadius = 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "finalCell", for: indexPath) as! finalTableViewCell
        let item: Memo = items[indexPath.row]
        cell.setCell(name: item.name, price: item.resultAmount)
        
        return cell
    }
    
    func readItems() -> [Memo] {
        return Array(realm.objects(Memo.self))
    }
    
    @IBAction func back(){
        realm.deleteAll()
        self.view.window?.rootViewController?.dismiss(animated: true)
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
