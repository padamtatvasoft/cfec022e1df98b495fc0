//
//  ViewController.swift
//  Practical Test
//
//  Created by padam on 06/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView : UICollectionView!
    var arrUsers : [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Practical Test";
        self.generateDummyUsers()
        // Do any additional setup after loading the view.
    }
    
    func generateDummyUsers()  {
        for i in 0..<11{
            let user = User(userName: "Test \(i)",userProfile: "");
            arrUsers.append(user);
        }
        print("Count:-\(arrUsers.count)")
        self.collectionView.reloadData()
    }


}


extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCollectionViewCell", for: indexPath) as! UserCollectionViewCell
        return cell;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrUsers.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if arrUsers.count % 2 == 0{
            return CGSize(width: (collectionView.frame.size.width-10)/2, height: (collectionView.frame.size.width-10)/2)
        }else{
            if indexPath.row == 0{
                return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width)
            }else{
                return CGSize(width: (collectionView.frame.size.width-10)/2, height: (collectionView.frame.size.width-10)/2)
            }
        }
    }
    
    
}
