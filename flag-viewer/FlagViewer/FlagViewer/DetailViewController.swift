//
//  DetailViewController.swift
//  FlagViewer
//
//  Created by Andrii Laptiiev on 27.08.2022.
//

import UIKit

class DetailViewController: UIViewController {
    var flagImage: String?
    @IBOutlet weak var flag: UIImageView?


    override func viewDidLoad() {
        super.viewDidLoad()

        if let flag = flag, let flagImage = flagImage {
            flag.image = UIImage(named: flagImage)
            
            flag.layer.borderWidth = 1
            flag.layer.borderColor = UIColor.black.cgColor
        }

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
    }

    @objc func share() {
        if let image = flag?.image, let name = flagImage {
            let vc = UIActivityViewController(activityItems: [image, name], applicationActivities: [])
            vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            present(vc, animated: true)
        }
    }
}
