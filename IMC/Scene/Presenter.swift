import UIKit

protocol Presenting {
    func displayResult(imc: Int, typeWeight: String, imageName: String)
}

final class Presenter {
    weak var viewController: Displaying?
}

// MARK: - Presenting
extension Presenter: Presenting {
    func displayResult(imc: Int, typeWeight: String, imageName: String) {
        let message = "\(imc): \(typeWeight)"
        let image = UIImage(named: imageName)
        viewController?.showResult(message: message, image: image)
    }
}
