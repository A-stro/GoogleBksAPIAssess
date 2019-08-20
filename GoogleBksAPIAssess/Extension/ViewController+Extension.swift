//
//  ViewController+Extension.swift
//  GoogleBksAPIAssess
//
//  Created by Aaron Gerell on 8/18/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

extension UIViewController {

    func goToDetail(with vm: ViewModel) {
        
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vm.delegate = (detailVC as! ViewModelDelegate)
//        detailVC.viewModel = vm
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    

}
