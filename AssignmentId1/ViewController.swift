//
//  ViewController.swift
//  AssignmentId1
//
//  Created by Mac on 15/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studentsNameTaableView: UITableView!
    
    var studentNames = ["Gajanan" , "Harsha" , "Arjun" ,"Aryan" , "Rutik" , "Shailesh" , "Ashitosh" , "Soham" , "Mahesh"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTableView()
    }
    func initializeTableView()
    {
        studentsNameTaableView.dataSource = self
        studentsNameTaableView.delegate = self
    }
}
extension ViewController : UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            studentsNameTaableView.beginUpdates()
            studentsNameTaableView.deleteRows(at: [indexPath], with: .fade)
            studentNames.remove(at: indexPath.row)
            studentsNameTaableView.endUpdates()
        }
    }
    
    
    
}

extension ViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        studentNames.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
        let BasicCell = self.studentsNameTaableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)

        if indexPath.row % 2 == 0{
            BasicCell.backgroundColor = .red
        }
        else
        {
            BasicCell.backgroundColor = .blue
        }
        
        BasicCell.textLabel?.text = studentNames[indexPath.row]
        return BasicCell
    }
    
    
}
