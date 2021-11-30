//
//  HomeMainViewVC.swift
//  Z2
//
//  Created by zed on 11/6/21.
//

import UIKit

struct Banners: Codable {
let data: [Banner]
}

struct Banner: Codable {
    let image: ImageOption
}

struct ImageOption: Codable {
    let large: String
    let original: String
}

struct Listings: Codable {
    let data: [Listing]
}

struct Listing: Codable {
    let view_count: Int
    let listing_age: Int /// 0 => new lisitng else ... days on z1
    let favorite: Bool
    let land_area: Double
    let short_address: String
    let property_type: String
    let image: ImageOption
}

class HomeMainViewTableVC: UIViewController {
    
    let addsURL = "https://api-stagging.z1platform.com/api/s36/api/v2/news_and_ads?format=Ads"
    let listingsURL = "https://api-stagging.z1platform.com/api/s36/api/v2/listings"
    var banners: [String] = []
    var imageList: [String] = []
    var viewCounts: [Int] = []
    var listingAges: [Int]  = []
    var landAreas: [Double] = []
    var shortAddress: [String] = []
    var propertyTypes:[String] = []
    
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(BannerTableViewCell.nib, forCellReuseIdentifier: BannerTableViewCell.id)
        tableView.register(LatestPropertyTableViewCell.nib, forCellReuseIdentifier: LatestPropertyTableViewCell.id)
        
        getBannerAPI()
        getListingAPI()

        
    }
    
    
    func getListingAPI(){
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: listingsURL)!)) { data, response, error in
            if let data = data {
                if let listings = try? JSONDecoder().decode(Listings.self, from: data) {
                    print(listings.data)
                   
                    let imageListing = listings.data.map({$0.image.original})
                    let shortAddress = listings.data.map({$0.short_address})
                    let propertyType = listings.data.map({$0.property_type})
                    let landArea = listings.data.map({$0.land_area})
                    let viewCount = listings.data.map({$0.view_count})
                    let listingAge = listings.data.map({$0.listing_age})
                    
                    self.listingAges = listingAge
                    self.viewCounts = viewCount
                    self.landAreas = landArea
                    self.propertyTypes = propertyType
                    self.shortAddress = shortAddress
                    self.imageList = imageListing
                    DispatchQueue.main.async {
                        self.tableView.reloadSections(IndexSet(integer: 1), with: .automatic)
                    }
                } else {
                    print("error decoding...")
                }
            }
        }.resume()
    }
    
    func getBannerAPI(){
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: addsURL)!)) { data, response, error in
            if let data = data {
                if let banners = try? JSONDecoder().decode(Banners.self, from: data) {
//                    print(banners)
                    let images = banners.data.map({$0.image.original})
                    self.banners = images
                    DispatchQueue.main.async {
                        self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
                    }
                } else {
                    print("error decoding...")
                }
            }
        }.resume()
    }
    
    
    
    

}
 
extension HomeMainViewTableVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return imageList.count
        default:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.id, for: indexPath) as! BannerTableViewCell
            cell.images = banners
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: LatestPropertyTableViewCell.id, for: indexPath) as!
            LatestPropertyTableViewCell
            
            cell.imageSell.image = UIImage(data: try! Data(contentsOf: URL(string: imageList[indexPath.row])!))
//            cell.viewCount.text = viewCounts[indexPath.row]
            cell.landArea.text = String(landAreas[indexPath.row])
            cell.shortAddress.text = shortAddress[indexPath.row]
            cell.propertyType.text = propertyTypes[indexPath.row]
            
            cell.viewCount.text = String(viewCounts[indexPath.row])
            cell.listingAge.text = String(listingAges[indexPath.row])
    
            
            return cell
        default:
            
            
            return UITableViewCell()
        }

        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 { return 100 }
        return 211
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            
            return "Latest Property"
        }
        
        return nil
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//        switch indexPath.section{
//        case 0 :
//            print("hello")
//        case 1 :
            let vc = UIStoryboard(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "detail") as? InfoDetail
            self.navigationController?.pushViewController(vc!, animated: true)

//        default:
//            print(Error.self)
//        }
//        print("hello")

    }

}



    // extension of id identifier
extension UITableViewCell {
    
    public static var id:String {
        return String(describing: self.self)
    }
    
    public static var nib: UINib {
        return UINib(nibName: self.id, bundle: nil)
    }
}
