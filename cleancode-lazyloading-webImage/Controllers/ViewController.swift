//
//  ViewController.swift
//  cleancode-lazyloading-webImage
//
//  Created by Sarath P on 31/12/22.
//

import UIKit


class LazyImageView: UIImageView {
    //Caching
    private let imageCache = NSCache<AnyObject, UIImage>()

    func loadImage(urlString: String) {
        guard let url = URL(string: urlString) else {return}
        
        if let cachedImage = imageCache.object(forKey: url as AnyObject) {
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: url) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.image = image
                        self.imageCache.setObject(image, forKey: url as AnyObject)
                    }
                }
            }
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var aryResponse: [ResponseData]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        getData()
    }
    
    func getData() {
        DataManager().getData(urlString: EndPoints().baseUrl) { result in
            self.aryResponse = result
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    func registerNib() {
        let xib = UINib(nibName: "DataCell", bundle: nil)
        self.tableView.register(xib, forCellReuseIdentifier: "DataCellXIB")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }


}

