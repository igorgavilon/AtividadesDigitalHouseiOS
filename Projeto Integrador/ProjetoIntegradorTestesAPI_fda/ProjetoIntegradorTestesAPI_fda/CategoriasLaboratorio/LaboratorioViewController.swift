//
//  LaboratorioViewController.swift
//  ProjetoIntegradorTestesAPI_fda
//
//  Created by Igor Gavilon on 03/11/20.
//

import UIKit
import Foundation


class LaboratorioViewController: UIViewController {

    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var viewTable: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var resultCount = 0
    var results = [Result]()
    var searchTerm = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.viewMenu.layer.cornerRadius = 40.0
        self.viewTable.layer.cornerRadius = 40.0
        
        accessAPI()
    }
    
    private func accessAPI(){
        //let queryStr = formatToQueryString(name)
        let fullURL = "https://api.fda.gov/drug/drugsfda.json?count=sponsor_name"
            //"https://api.fda.gov/drug/label.json?search=openfda.brand_name:\(self.searchTerm)"
            //"https://api.fda.gov/drug/label.json?count=openfda.generic_name&limit=20"
            //"https://jsonplaceholder.typicode.com/users/"

        DispatchQueue.main.async {
            // 2
            guard let url = URL(string: fullURL),
            let data = try? Data(contentsOf: url) else { return }

            // 3
            if let search = try? JSONDecoder().decode(SponsorName.self, from: data) {
              // 4
              //self.arrayUsers = search
                self.resultCount = search.results.count
                self.results = search.results
              self.tableView.reloadData()
                print(self.results.count)

            } else {
                print("erro")
            }
        }
    }


}
extension LaboratorioViewController: UITableViewDelegate{
    
    
}
extension LaboratorioViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LaboratorioTableViewCell", for: indexPath) as! LaboratorioTableViewCell
        
        cell.setupCell(lab: self.results[indexPath.row])
        
        return cell
    }
    
    
    
}


// MARK: - SponsorName
class SponsorName: Codable {
    let meta: Meta
    let results: [Result]

    init(meta: Meta, results: [Result]) {
        self.meta = meta
        self.results = results
    }
}
