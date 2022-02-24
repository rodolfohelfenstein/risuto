import Foundation

struct CategoryListModels {

    struct Response {
        let items: [Item]

        struct Item {
            var id: String
            var name: String
            var thumb: URL
        }
    }

    struct ViewModel {
        let items: [Item]

        struct Item: Identifiable {
            var id: String
            var name: String
            var thumb: URL
        }
    }

}
