public protocol Film {
    var id: String { get }
    var title: String { get }
    var originalTitle: String { get }
    var originalTitleRomanised: String { get }
    var image: String { get }
    var banner: String { get }
    var description: String { get }
    var director: String { get }
    var producer: String { get }
    var releaseDate: String { get }
    var runningTime: Int { get }
    var rottenTomatoes: Int { get }
}
