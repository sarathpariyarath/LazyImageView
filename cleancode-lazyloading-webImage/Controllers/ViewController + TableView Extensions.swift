//
//  ViewController + TableView Extensions.swift
//  cleancode-lazyloading-webImage
//
//  Created by Sarath P on 31/12/22.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aryResponse?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataCellXIB") as? DataCell else {return UITableViewCell()}
        
        let response = aryResponse?[indexPath.row]
        
        cell.thumbImgView.loadImage(urlString: response?.thumbnailUrl ?? "")
        
        cell.lblName.text = response?.title
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
