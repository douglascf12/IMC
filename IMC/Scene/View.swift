import UIKit

class View: UIView {
    weak var delegate: ViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 36.0)
        label.text = "Cálculo do IMC"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "Descubra o seu índice de Massa Corporal"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "Peso (Kg)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "Altura (m)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weightTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.frame.size = CGSize(width: 110, height: 34)
        textField.placeholder = "Ex: 75"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var heightTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.frame.size = CGSize(width: 110, height: 34)
        textField.placeholder = "Ex: 1,75"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var weightStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var heightStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var horizontalStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = UIColor(named: "buttonBackgroundColor")
        button.setTitleColor(UIColor(named: "buttonTintColor"), for: .normal)
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var resultView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var descriptionResultLabel: UILabel = {
        let label = UILabel()
        label.text = "Seu índice de Massa Corporal é"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.textColor = .darkGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24.0, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var resultImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
        resultView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
    
    @objc
    private func didTapButton() {
        guard let weight = Double(weightTextField.text ?? String()),
              let height = Double(heightTextField.text ?? String())
        else { return }
        delegate?.calculate(weight: weight, height: height)
    }
    
    func setup(message: String, image: UIImage?) {
        resultLabel.text = message
        resultImageView.image = image
        resultView.isHidden = false
        resultImageView.isHidden = false
        endEditing(true)
    }
}

// MARK: - ViewDelegate
protocol ViewDelegate: AnyObject {
    func calculate(weight: Double, height: Double)
}

// MARK: - ViewCode
extension View: ViewCode {
    func addSubviews() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        weightStackview.addArrangedSubview(weightLabel)
        weightStackview.addArrangedSubview(weightTextField)
        heightStackview.addArrangedSubview(heightLabel)
        heightStackview.addArrangedSubview(heightTextField)
        horizontalStackview.addArrangedSubview(weightStackview)
        horizontalStackview.addArrangedSubview(heightStackview)
        addSubview(horizontalStackview)
        addSubview(calculateButton)
        resultView.addSubview(descriptionResultLabel)
        resultView.addSubview(resultLabel)
        resultView.addSubview(resultImageView)
        addSubview(resultView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            horizontalStackview.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            horizontalStackview.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            weightLabel.widthAnchor.constraint(equalToConstant: 110),
            weightTextField.widthAnchor.constraint(equalTo: weightLabel.widthAnchor),
            
            heightLabel.widthAnchor.constraint(equalToConstant: 110),
            heightTextField.widthAnchor.constraint(equalTo: heightLabel.widthAnchor),
            
            calculateButton.topAnchor.constraint(equalTo: horizontalStackview.bottomAnchor, constant: 12),
            calculateButton.leadingAnchor.constraint(equalTo: horizontalStackview.leadingAnchor),
            calculateButton.trailingAnchor.constraint(equalTo: horizontalStackview.trailingAnchor),
            
            resultView.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
            resultView.leadingAnchor.constraint(equalTo: leadingAnchor),
            resultView.trailingAnchor.constraint(equalTo: trailingAnchor),
            resultView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            descriptionResultLabel.topAnchor.constraint(equalTo: resultView.topAnchor, constant: 16),
            descriptionResultLabel.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 16),
            descriptionResultLabel.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -16),
            
            resultLabel.topAnchor.constraint(equalTo: descriptionResultLabel.bottomAnchor, constant: 16),
            resultLabel.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 16),
            resultLabel.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -16),
            
            resultImageView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 16),
            resultImageView.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 16),
            resultImageView.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -16),
            resultImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    func setupStyle() {
        backgroundColor = UIColor(named: "backgroundColor")
    }
}
