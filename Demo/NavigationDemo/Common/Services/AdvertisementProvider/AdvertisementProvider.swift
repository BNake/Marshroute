import Foundation

typealias AdvertisementId = String

struct Advertisement {
    let title: String
    let id: AdvertisementId
    let rgb: (red: Double, green: Double, blue: Double)
    let description: String
    let recommendedSearchResults: [SearchResult]
}

protocol AdvertisementProvider: class {
    func advertisement(advertisementId advertisementId: AdvertisementId) -> Advertisement
}
