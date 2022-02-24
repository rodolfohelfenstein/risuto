public protocol DataDisplayer: AnyObject {
    associatedtype Data
    func display(data: Data)
}
