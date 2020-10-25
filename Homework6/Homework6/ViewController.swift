//
//  ViewController.swift
//  Homework6
//
//  Created by Олег Романов on 24.10.2020.
//

import UIKit

struct Contact {
    var firstName: String
    var lastName: String
    var phoneNumber: String
}

class ViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
        title = "Contacts"
    }
    
    struct SectionData {
        var cells : [Contact]
    }
    
    private var sectionsData: [SectionData]?
    
    private func loadData() {
        sectionsData = [
            SectionData(cells: [
                Contact(firstName: "John", lastName: "Appleseed", phoneNumber: "(888) 555-5512")
            ]),
            SectionData(cells: [
                Contact(firstName: "Bruce", lastName: "Banner", phoneNumber: "(755) 105-1962"),
                Contact(firstName: "James", lastName: "Bond", phoneNumber: "(555) 007-5555"),
                Contact(firstName: "Kate", lastName: "Bell", phoneNumber: "(555) 564-8583")
            ]),
            SectionData(cells: [
                Contact(firstName: "Anna", lastName: "Haro", phoneNumber: "(555) 522-8243"),
                Contact(firstName: "Daniel", lastName: "Higgins Jr.", phoneNumber: "(555) 478-7662"),
                Contact(firstName: "James", lastName: "Hetfield", phoneNumber: "(888) 372-1262")

            ]),
            SectionData(cells: [
                Contact(firstName: "David", lastName: "Taylor", phoneNumber: "(555) 610-6679"),
                Contact(firstName: "Ken", lastName: "Tapped", phoneNumber: "(408) 555-5270"),
                Contact(firstName: "Robert", lastName: "Teas", phoneNumber: "(408) 555-3514")
            ])
        ]
    }
    
    private func configureCell(cell: UITableViewCell, indexPath: IndexPath) -> UITableViewCell {
        let name = sectionsData?[indexPath.section].cells[indexPath.row].firstName ?? ""
        let surname = sectionsData?[indexPath.section].cells[indexPath.row].lastName ?? ""
        
        cell.textLabel?.text = name + " " + surname
        return cell
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionData = sectionsData?[section] else { return 0 }
        
        return sectionData.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Basic", for: indexPath)
        cell = configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "A"
        case 1:
            return "B"
        case 2:
            return "H"
        case 3:
            return "T"
        default:
        return ""
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let contact = sectionsData?[indexPath.section].cells[indexPath.row]
        else { return }
        let contactController = ContactController(contact: contact)
        navigationController?.pushViewController(contactController, animated: true)
    }
}

