import UIKit

enum Factory {
    static func make() -> UIViewController {
        let presenter = Presenter()
        let interactor = Interactor(presenter: presenter)
        let viewController = ViewController(interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
