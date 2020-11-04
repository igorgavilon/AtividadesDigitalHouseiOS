//
//  ResultadosBuscaViewController.swift
//  ProjetoIntegradorTestesAPI_fda
//
//  Created by Igor Gavilon on 01/11/20.
//

import UIKit
import Foundation

class ResultadosBuscaViewController: UIViewController {

    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var viewFields: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
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
        self.viewFields.layer.cornerRadius = 40.0
        self.searchBar.layer.cornerRadius = 20.0
        
        accessAPI()
    }
    
    private func accessAPI(){
        //let queryStr = formatToQueryString(name)
        let fullURL = "https://api.fda.gov/drug/label.json?count=openfda.generic_name&limit=20"
            //"https://api.fda.gov/drug/label.json?search=openfda.brand_name:\(self.searchTerm)"
            //"https://api.fda.gov/drug/label.json?count=openfda.generic_name&limit=20"
            //"https://jsonplaceholder.typicode.com/users/"

        DispatchQueue.main.async {
            // 2
            guard let url = URL(string: fullURL),
            let data = try? Data(contentsOf: url) else { return }

            // 3
            if let search = try? JSONDecoder().decode(GenericName.self, from: data) {
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
extension ResultadosBuscaViewController: UITableViewDelegate {
    
    
}
extension ResultadosBuscaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultadosBuscaTableViewCell", for: indexPath) as! ResultadosBuscaTableViewCell
        
        cell.setupCell(drug: self.results[indexPath.row])
        
        return cell
    }
    
    
    
}


// MARK: - GenericName
class GenericName: Codable {
    let meta: Meta
    let results: [Result]

    init(meta: Meta, results: [Result]) {
        self.meta = meta
        self.results = results
    }
}

// MARK: - Meta
class Meta: Codable {
    let disclaimer: String
    let terms, license: String
    let lastUpdated: String

    enum CodingKeys: String, CodingKey {
        case disclaimer, terms, license
        case lastUpdated = "last_updated"
    }

    init(disclaimer: String, terms: String, license: String, lastUpdated: String) {
        self.disclaimer = disclaimer
        self.terms = terms
        self.license = license
        self.lastUpdated = lastUpdated
    }
}

// MARK: - Result
class Result: Codable {
    let term: String
    let count: Int

    init(term: String, count: Int) {
        self.term = term
        self.count = count
    }
}
