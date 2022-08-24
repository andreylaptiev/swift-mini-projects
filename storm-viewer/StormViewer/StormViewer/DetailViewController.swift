//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Andrii Laptiiev on 21.08.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    var imageNumber: Int?
    var imagesCount: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Picture \(imageNumber!) of \(imagesCount!)"
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
