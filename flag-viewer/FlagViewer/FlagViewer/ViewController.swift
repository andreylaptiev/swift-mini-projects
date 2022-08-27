//
//  ViewController.swift
//  FlagViewer
//
//  Created by Andrii Laptiiev on 27.08.2022.
//

import UIKit

class TableViewController: UITableViewController {
    var flags = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.flags = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "spain", "uk", "us"]
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = flags[indexPath.row]
        content.image = UIImage(named: flags[indexPath.row])

        cell.contentConfiguration = content
        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detail = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            detail.flagImage = flags[indexPath.row]
            navigationController?.pushViewController(detail, animated: true)
        }
    }
}
