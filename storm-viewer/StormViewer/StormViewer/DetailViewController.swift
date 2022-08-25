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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))

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

    @objc func share() {
        guard let image = imageView.image, let imageName = selectedImage else {
            let alert = UIAlertController(
                title: "No image found",
                message: "Nothing to share",
                preferredStyle: .alert
            )
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
            return
        }

        let vc = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
        // for iPad
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem

        present(vc, animated: true)
    }
}
