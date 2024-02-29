protocol Interacting: AnyObject {
    func calculate(weight: Double, height: Double)
}

final class Interactor {
    private let presenter: Presenting
    
    init(presenter: Presenting) {
        self.presenter = presenter
    }
}

// MARK: - Interacting
extension Interactor: Interacting {
    func calculate(weight: Double, height: Double) {
        let imc = weight / (height * height)
        switch imc {
        case 0..<16:
            presenter.displayResult(result: "\(Int(imc)): Magreza", image: "abaixo")
        case 16..<18.5:
            presenter.displayResult(result: "\(Int(imc)): Abaixo do peso", image: "abaixo")
        case 18.5..<25:
            presenter.displayResult(result: "\(Int(imc)): Peso ideal", image: "ideal")
        case 25..<30:
            presenter.displayResult(result: "\(Int(imc)): Sobrepeso", image: "sobre")
        default:
            presenter.displayResult(result: "\(Int(imc)): Obesidade", image: "obesidade")
        }
        
    }
}
