public protocol Film {
    var id: String { get }
    var title: String { get }
    var originalTitle: String { get }
    var originalTitleRomanised: String { get }
    var description: String { get }
    var director: String { get }
    var releaseDate: String { get }
}
