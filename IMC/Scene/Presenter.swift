protocol Presenting {
    func displayResult(result: String, image: String)
}

final class Presenter {
    weak var viewController: Displaying?
}

// MARK: - Presenting
extension Presenter: Presenting {
    func displayResult(result: String, image: String) {
        viewController?.showResult(result: result, image: image)
    }
}
