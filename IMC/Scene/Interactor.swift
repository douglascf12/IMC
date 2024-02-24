protocol Interacting: AnyObject {
    // todo
}

final class Interactor {
    private let presenter: Presenting
    
    init(presenter: Presenting) {
        self.presenter = presenter
    }
}

// MARK: - Interacting
extension Interactor: Interacting {
    // todo
}
