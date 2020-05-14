//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

enum ColorCode {
    case black
    case brown
    case red
    case orange
    case yellow
    case green
    case blue
    case violet
    case gray
    case white
    case gold
    case silver
    case none
}

enum RingType {
    case digit
    case multiplier
    case tolerance
}

class MyViewController : UIViewController {
    let resistorView = UIView()
    let formulaImageView = UIImageView()
    let resistorImageView = UIImageView()
    let lineImageView  = UIImageView()
    
    let ringOneView = UIView()
    let ringTwoView = UIView()
    let ringThreeView = UIView()
    let ringFourView = UIView()
    
    let button = UIButton()
    let titleLabel = UILabel()
    let resistanceLabel  = UILabel()
    
    var valueLabels = [UILabel]()
    var ringButtons = [UIButton]()
    var colorButtons = [UIButton]()
    
    let ringButtonStackView = UIStackView()
    let colorButtonStackView = UIStackView()
    
    var resistorRings: [ColorCode] = [.brown, .black, .red, .gold]
    
    var rings: [Float] = [0, 0, 0, 0]
    let ringsTypes: [RingType] = [.digit, .digit, .multiplier, .tolerance]
    let colors: [UIColor] =  [#colorLiteral(red: 0.04647368193, green: 0.01779429056, blue: 0.01532345638, alpha: 1), #colorLiteral(red: 0.6445639729, green: 0.1679448187, blue: 0.1656729877, alpha: 1), #colorLiteral(red: 1, green: 0.0007271112408, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.6460297108, blue: 0.007757570129, alpha: 1), #colorLiteral(red: 0.9998962283, green: 1, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.6916304827, blue: 0.3131190538, alpha: 1), #colorLiteral(red: 0.01152653154, green: 0.4388318062, blue: 0.7538933158, alpha: 1), #colorLiteral(red: 1, green: 0, blue: 1, alpha: 1), #colorLiteral(red: 0.4519323111, green: 0.4520125389, blue: 0.4519209862, alpha: 1), #colorLiteral(red: 0.9998951554, green: 1, blue: 0.999871552, alpha: 1), #colorLiteral(red: 0.8821009398, green: 0.8446164131, blue: 0, alpha: 1), #colorLiteral(red: 0.8521430492, green: 0.8522866368, blue: 0.8521227837, alpha: 1), .clear]
    let colorCodes: [ColorCode] = [.black, .brown, .red, .orange, .yellow, .green, .blue, .violet, .gray, .white, .gold, .silver, .none]
    
    let digitLabelValue = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "", "", ""]
    let multiplierLabelValue = ["0", "1", "2", "3", "4", "5", "6", "7", "", "", "-1", "-2", ""]
    let toleranceLabelValue = ["", "1", "2", "", "", "0.5", "0.25", "0.1", "0.05", "", "5", "10", "20"]
    
    var currentRing: Int = 0 {
        didSet {
            for index in 0...12 {
                switch currentRing {
                case 21:
                    valueLabels[index].text = digitLabelValue[index]
                    break
                case 22:
                    valueLabels[index].text = digitLabelValue[index]
                    break
                case 23:
                    valueLabels[index].text = multiplierLabelValue[index]
                    break
                case 24:
                    valueLabels[index].text = toleranceLabelValue[index]
                    break
                default:
                    break
                }
                
                if valueLabels[index].text == "" {
                    colorButtons[index].isEnabled = false
                    colorButtons[index].alpha = 0.25
                    
                } else {
                    colorButtons[index].isEnabled = true
                    colorButtons[index].alpha = 1
                }
            }
            
            for button in ringButtons {
                if currentRing == button.tag {
                    button.layer.borderWidth = 5
                } else {
                    button.layer.borderWidth = 1
                }
            }
        }
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        
        setupView()
        setupStackViewRingButton()
        setupStackViewColorButton()
        
        currentRing = 21
        getRingColor()
    }
    
    func setupStackViewRingButton() {
        view.addSubview(ringButtonStackView)
        
        ringButtonStackView.axis = .horizontal
        ringButtonStackView.distribution = .fillEqually
        ringButtonStackView.spacing = 20

        for i in 1...4 {
            let button = UIButton()
            button.setTitle("Ring \(i)", for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 30)
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9795703292, green: 0.9797341228, blue: 0.9795469642, alpha: 1)
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 0.5912953019, green: 0.5913977027, blue: 0.591280818, alpha: 1)
            button.layer.cornerRadius = 10
            button.tag = 20 + i
            button.addTarget(self, action: #selector(ringButton), for: .touchUpInside)
            ringButtons.append(button)
            ringButtonStackView.addArrangedSubview(button)
        }
        
        ringButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        ringButtonStackView.topAnchor.constraint(equalTo: lineImageView.bottomAnchor, constant: 15).isActive = true
        ringButtonStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        ringButtonStackView.widthAnchor.constraint(equalToConstant: 660).isActive = true
        ringButtonStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc func ringButton(sender: UIButton!) {
        currentRing = sender.tag
    }
    
    func setupStackViewColorButton() {
        var index = 0
        
        colorButtonStackView.axis = .vertical
        colorButtonStackView.distribution = .fillEqually
        colorButtonStackView.alignment = .center
        colorButtonStackView.spacing = 10
        
        for line in 0...2 {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = 45
            
            var column = 4
            if line == 2 {
                column = 2
            }
            
            for _ in 0...column {
                let stackView2 = UIStackView()
                stackView2.axis = .vertical
                stackView2.distribution = .fill
                stackView2.spacing = 5
                
                let label = UILabel()
                label.text = "\(index)"
                label.font = label.font.withSize(20)
                label.textAlignment = .center
                label.textColor = .black
                valueLabels.append(label)
                
                let button = UIButton()
                button.backgroundColor = colors[index]
                if index == 9 {
                    button.layer.borderWidth = 1
                    button.layer.borderColor = #colorLiteral(red: 0.5912953019, green: 0.5913977027, blue: 0.591280818, alpha: 1)
                }
                if index == 10 {
                    button.setTitle("Gold", for: .normal)
                    button.titleLabel?.font = .systemFont(ofSize: 20)
                    button.setTitleColor(.black, for: .normal)
                }
                if index == 11 {
                    button.setTitle("Silver", for: .normal)
                    button.titleLabel?.font = .systemFont(ofSize: 20)
                    button.setTitleColor(.black, for: .normal)
                }
                if index == 12 {
                    button.setTitle("None", for: .normal)
                    button.titleLabel?.font = .systemFont(ofSize: 20)
                    button.setTitleColor(.black, for: .normal)
                    button.layer.borderWidth = 1
                    button.layer.borderColor = #colorLiteral(red: 0.5912953019, green: 0.5913977027, blue: 0.591280818, alpha: 1)
                }
                button.layer.cornerRadius = 10
                button.tag = index
                button.addTarget(self, action: #selector(colorButton), for: .touchUpInside)
                button.translatesAutoresizingMaskIntoConstraints = false
                button.widthAnchor.constraint(equalToConstant: 60).isActive = true
                button.heightAnchor.constraint(equalToConstant: 60).isActive = true
                colorButtons.append(button)
                
                stackView2.addArrangedSubview(label)
                stackView2.addArrangedSubview(button)
                stackView.addArrangedSubview(stackView2)
                index += 1
            }
            colorButtonStackView.addArrangedSubview(stackView)
        }

        view.addSubview(colorButtonStackView)
        colorButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        colorButtonStackView.topAnchor.constraint(equalTo: ringButtonStackView.bottomAnchor, constant: 25).isActive = true
        colorButtonStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    @objc func colorButton(sender: UIButton!) {
        switch currentRing {
        case 21:
            ringOneView.backgroundColor = sender.backgroundColor
            break
        case 22:
            ringTwoView.backgroundColor = sender.backgroundColor
            break
        case 23:
            ringThreeView.backgroundColor = sender.backgroundColor
            break
        case 24:
            ringFourView.backgroundColor = sender.backgroundColor
            break
        default:
            break
        }
        resistorRings[currentRing-21] = colorCodes[sender.tag]
        getRingColor()
    }
    
    func setupView() {
        //title label
        view.addSubview(titleLabel)
        titleLabel.text = "Resistor Color Code"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 50)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        
        //resistance label
        view.addSubview(resistanceLabel)
        resistanceLabel.text = "Resistance Value : 1,000 ± 5% Ω"
        resistanceLabel.font = resistanceLabel.font.withSize(30)
        resistanceLabel.textAlignment = .center
        resistanceLabel.textColor = .black
        
        //formula image view
        view.addSubview(formulaImageView)
        formulaImageView.image = UIImage(named: "Formula@3x.png")
        
        //resistorview
        view.addSubview(resistorView)
        
        //resistor image view
        resistorView.addSubview(resistorImageView)
        resistorImageView.image = UIImage(named: "Resistor@3x.png")
        
        //ring view
        resistorView.addSubview(ringOneView)
        resistorView.addSubview(ringTwoView)
        resistorView.addSubview(ringThreeView)
        resistorView.addSubview(ringFourView)
        
        ringOneView.backgroundColor = .brown
        ringTwoView.backgroundColor = .black
        ringThreeView.backgroundColor = .red
        ringFourView.backgroundColor = #colorLiteral(red: 0.8832723498, green: 0.8428586721, blue: 0.01232801843, alpha: 1)
        
        //line view
        view.addSubview(lineImageView)
        lineImageView.image = UIImage(named: "Line@3x.png")
        
        setupViewContraint()
    }
    
    func setupViewContraint() {
        //title label contraint
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 55).isActive = true
        
        //resistance label contraint
        resistanceLabel.translatesAutoresizingMaskIntoConstraints = false
        resistanceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25).isActive  =  true
        resistanceLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        resistanceLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
        //formula image view  contraint
        formulaImageView.translatesAutoresizingMaskIntoConstraints = false
        formulaImageView.topAnchor.constraint(equalTo: resistanceLabel.bottomAnchor, constant: 10).isActive = true
        formulaImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        formulaImageView.widthAnchor.constraint(equalToConstant: 423).isActive = true
        formulaImageView.heightAnchor.constraint(equalToConstant: 27).isActive = true
        
        //resistorview contraint
        resistorView.translatesAutoresizingMaskIntoConstraints = false
        resistorView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        resistorView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        resistorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        resistorView.topAnchor.constraint(equalTo: formulaImageView.bottomAnchor, constant: 35).isActive = true
        
        //resistor image view contraint
        resistorImageView.translatesAutoresizingMaskIntoConstraints = false
        resistorImageView.leadingAnchor.constraint(equalTo: resistorView.leadingAnchor, constant: 0).isActive = true
        resistorImageView.trailingAnchor.constraint(equalTo: resistorView.trailingAnchor, constant: 0).isActive = true
        resistorImageView.topAnchor.constraint(equalTo: resistorView.topAnchor, constant: 0).isActive = true
        resistorImageView.bottomAnchor.constraint(equalTo: resistorView.bottomAnchor, constant: 0).isActive = true
        
        //ring view contraint
        ringOneView.translatesAutoresizingMaskIntoConstraints = false
        ringOneView.leadingAnchor.constraint(equalTo: resistorView.leadingAnchor, constant: 121.5).isActive = true
        ringOneView.centerYAnchor.constraint(equalTo: resistorView.centerYAnchor, constant: -0.5).isActive = true
        ringOneView.heightAnchor.constraint(equalToConstant: 122).isActive = true
        ringOneView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        ringTwoView.translatesAutoresizingMaskIntoConstraints = false
        ringTwoView.leadingAnchor.constraint(equalTo: resistorView.leadingAnchor, constant: 178).isActive = true
        ringTwoView.centerYAnchor.constraint(equalTo: resistorView.centerYAnchor, constant: -0.5).isActive = true
        ringTwoView.heightAnchor.constraint(equalToConstant: 100.5).isActive = true
        ringTwoView.widthAnchor.constraint(equalToConstant: 18.5).isActive = true

        ringThreeView.translatesAutoresizingMaskIntoConstraints = false
        ringThreeView.leadingAnchor.constraint(equalTo: resistorView.leadingAnchor, constant: 218.5).isActive = true
        ringThreeView.centerYAnchor.constraint(equalTo: resistorView.centerYAnchor, constant: 0).isActive = true
        ringThreeView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        ringThreeView.widthAnchor.constraint(equalToConstant: 18).isActive = true

        ringFourView.translatesAutoresizingMaskIntoConstraints = false
        ringFourView.leadingAnchor.constraint(equalTo: resistorView.leadingAnchor, constant: 280).isActive = true
        ringFourView.centerYAnchor.constraint(equalTo: resistorView.centerYAnchor, constant: 0.5).isActive = true
        ringFourView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        ringFourView.widthAnchor.constraint(equalToConstant: 18.5).isActive = true
        
        //line view contraint
        lineImageView.translatesAutoresizingMaskIntoConstraints = false
        lineImageView.topAnchor.constraint(equalTo: resistorView.bottomAnchor, constant: -6).isActive = true
        lineImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        lineImageView.widthAnchor.constraint(equalToConstant: 512).isActive = true
        lineImageView.heightAnchor.constraint(equalToConstant: 68).isActive = true
        
    }
    
    func getRingColor() {
        
        for i in 0...3 {
            rings[i] = colorToValue(ringColor: resistorRings[i], ringType: ringsTypes[i])
        }
        
        let resistance = calculateResistance(rings: rings)

        //Formatting to 1 decimal
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        let formattedResistance = formatter.string(from: Float(resistance) as NSNumber)
        let formattedRing = formatter.string(from: Float(rings[3]) as NSNumber)

        
        let resistanceString = "\(formattedResistance!) ± \(formattedRing!)% Ω"
        resistanceLabel.text = "Resistance Value : \(resistanceString)"
    }
    
    func calculateResistance(rings: [Float]) -> Float {
        let resistance = (rings[0]*10 + rings[1]) * powf(10, rings[2])
        return resistance
    }
    
    func colorToValue(ringColor: ColorCode,ringType: RingType) -> Float {
        var ringValue = Float()
        switch ringType {
        case .digit:
            switch ringColor {
            case .black:
                ringValue = 0
            case .brown:
                ringValue = 1
            case .red:
                ringValue = 2
            case .orange:
                ringValue = 3
            case .yellow:
                ringValue = 4
            case .green:
                ringValue = 5
            case .blue:
                ringValue = 6
            case .violet:
                ringValue = 7
            case .gray:
                ringValue = 8
            case .white:
                ringValue = 9
            case .gold:
                ringValue = 10
            case .silver:
                ringValue = 10
            case .none:
                ringValue = 10
            }
        case .multiplier:
            switch ringColor {
            case .black:
                ringValue = 0
            case .brown:
                ringValue = 1
            case .red:
                ringValue = 2
            case .orange:
                ringValue = 3
            case .yellow:
                ringValue = 4
            case .green:
                ringValue = 5
            case .blue:
                ringValue = 6
            case .violet:
                ringValue = 7
            case .gray:
                ringValue = 10
            case .white:
                ringValue = 10
            case .gold:
                ringValue = -1
            case .silver:
                ringValue = -2
            case .none:
                ringValue = 10
            }
        case .tolerance:
            switch ringColor {
            case .black:
                ringValue = 100
            case .brown:
                ringValue = 1
            case .red:
                ringValue = 2
            case .orange:
                ringValue = 100
            case .yellow:
                ringValue = 100
            case .green:
                ringValue = 0.5
            case .blue:
                ringValue = 0.25
            case .violet:
                ringValue = 0.1
            case .gray:
                ringValue = 0.05
            case .white:
                ringValue = 100
            case .gold:
                ringValue = 5
            case .silver:
                ringValue = 10
            case .none:
                ringValue = 20
            }
        }
        return ringValue
    }
    
}
// Present the view controller in the Live View window
let vc = MyViewController()
vc.preferredContentSize = CGSize(width: 750, height: 900)
PlaygroundPage.current.liveView = vc
