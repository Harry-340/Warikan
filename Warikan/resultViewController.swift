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
    var screenShotImage : UIImage?

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
        try! realm.write {
              realm.deleteAll()
          }
       // realm.deleteAll()
        self.view.window?.rootViewController?.dismiss(animated: true)
    }
    

    
    func takeScreenShot() -> UIImage {
        let width: CGFloat = tableView.bounds.size.width
        let height: CGFloat = tableView.bounds.size.height
        let size = CGSize(width: width, height: height - 50)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        view.drawHierarchy(in: tableView.bounds, afterScreenUpdates: true)
        let screenShotImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return screenShotImage
    }
    
    @IBAction func share(_ sender: Any) {
        let image = takeScreenShot()
        let text = "割り勘金額"
        let items = [text, image] as [Any]
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityVC, animated: true)
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
