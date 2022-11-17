//
//  UIImageView+Extension.swift
//  RickAndMorty
//
//  Created by Anthony Taylor on 2022-11-16.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImageFromURL(url: String) {
        guard let url = URL(string: url) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            
            let session = URLSession(configuration: .default)
            session.dataTask(with: url) {(data, response, error) in
                if let error = error {
                    print("error is \(error.localizedDescription)")
                    return
                }
                guard let data = data else {
                    //THERE IS NO DATA RETURNED
                    //Handle it how you want
                    return
                }
                
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }.resume()
        }
    }
    
    public func imageFromServerURL(urlString: String, PlaceHolderImage:UIImage) {

            if self.image == nil{
                  self.image = PlaceHolderImage
            }

            URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

                if error != nil {
                    print(error ?? "No Error")
                    return
                }
                DispatchQueue.main.async(execute: { () -> Void in
                    let image = UIImage(data: data!)
                    self.image = image
                })

            }).resume()
        }
}



extension UIImage {
    func blur(_ radius: Double) -> UIImage? {
        if let img = CIImage(image: self) {
            return UIImage(ciImage: img.applyingGaussianBlur(sigma: radius))
        }
        return nil
    }
}
