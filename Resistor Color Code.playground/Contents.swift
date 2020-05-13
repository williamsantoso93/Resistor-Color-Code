//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

enum ColorCode {
    case black
    case brown
    case red
    case orang
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
    let resistorImageView = UIImageView()
    let lineImageView  = UIImageView()
    
    let ringOneView = UIView()
    let ringTwoView = UIView()
    let ringThreeView = UIView()
    let ringFourView = UIView()
    
    let button = UIButton()
    let titleLabel = UILabel()
    let resistanceLabel  = UILabel()
    
    
    var resistorRings: [ColorCode] = [.none, .none, .none, .none]
    
    var rings: [Float] = [0, 0, 0, 0]
    let ringsType: [RingType] = [.digit, .digit, .multiplier, .tolerance]
    
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .white
        
        view.addSubview(label)
        self.view = view
        
//        setupLabelView()
//        setupResistorView()
//        setupResistorImageView()
//        setupRingView()
//        setupLineImageView()
        setupView()
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .green
        button.setTitle("Test Button", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        view.addSubview(button)
        getRingColor()
    }

    @objc func buttonAction(sender: UIButton!) {
        ringOneView.backgroundColor = .red
        ringTwoView.backgroundColor = .green
        ringThreeView.backgroundColor = .blue
        ringFourView.backgroundColor = .yellow
        resistanceLabel.text = "Resistance Value :0"
    }
    
    func setupView() {
        //title label
        view.addSubview(titleLabel)
        
        titleLabel.text = "Resistor Color Code"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 50)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.backgroundColor = .red
        
        //resistance label
        view.addSubview(resistanceLabel)
        resistanceLabel.text = "Resistance Value : 90.000.000 ohm ± 5.0%"
        resistanceLabel.font = resistanceLabel.font.withSize(30)
        resistanceLabel.textAlignment = .center
        resistanceLabel.textColor = .black
        resistanceLabel.backgroundColor = .red
        
        //formula image view
        
        
        //resistorview
        view.addSubview(resistorView)
        resistorView.backgroundColor = .white
        
        //resistor image view
        resistorView.addSubview(resistorImageView)
        resistorImageView.image = UIImage(named: "Resistor@3x.png")
        
        //ring view
        resistorView.addSubview(ringOneView)
        resistorView.addSubview(ringTwoView)
        resistorView.addSubview(ringThreeView)
        resistorView.addSubview(ringFourView)
        
        ringOneView.backgroundColor = .white
        ringTwoView.backgroundColor = .white
        ringThreeView.backgroundColor = .white
        ringFourView.backgroundColor = .white
        
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
        
        
        //resistorview contraint
        resistorView.translatesAutoresizingMaskIntoConstraints = false
        resistorView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        resistorView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        resistorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        resistorView.topAnchor.constraint(equalTo: resistanceLabel.bottomAnchor, constant: 50).isActive = true
        
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
    
    func setupLabelView() {
        view.addSubview(titleLabel)
        
        titleLabel.text = "Resistor Color Code"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 50)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.backgroundColor = .red
        
        view.addSubview(resistanceLabel)
        resistanceLabel.text = "Resistance Value : 90.000.000 ohm ± 5.0%"
        resistanceLabel.font = resistanceLabel.font.withSize(30)
        resistanceLabel.textAlignment = .center
        resistanceLabel.textColor = .black
        resistanceLabel.backgroundColor = .red
        
        setupLabelViewContraint()
    }
    
    func setupLabelViewContraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 55).isActive = true
        
        resistanceLabel.translatesAutoresizingMaskIntoConstraints = false
        resistanceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25).isActive  =  true
        resistanceLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        resistanceLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
    }
    
    func setupResistorView() {
        view.addSubview(resistorView)
        
        resistorView.backgroundColor = .white
        setupResistorViewContriant()
    }
    
    func setupResistorViewContriant() {
        resistorView.translatesAutoresizingMaskIntoConstraints = false
        resistorView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        resistorView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        resistorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        resistorView.topAnchor.constraint(equalTo: resistanceLabel.bottomAnchor, constant: 50).isActive = true
    }
    
    func setupResistorImageView() {
        resistorView.addSubview(resistorImageView)
        resistorImageView.image = UIImage(named: "Resistor@3x.png")
        setupResistorImageViewContriant()
    }
    
    func setupResistorImageViewContriant() {
        resistorImageView.translatesAutoresizingMaskIntoConstraints = false
        resistorImageView.leadingAnchor.constraint(equalTo: resistorView.leadingAnchor, constant: 0).isActive = true
        resistorImageView.trailingAnchor.constraint(equalTo: resistorView.trailingAnchor, constant: 0).isActive = true
        resistorImageView.topAnchor.constraint(equalTo: resistorView.topAnchor, constant: 0).isActive = true
        resistorImageView.bottomAnchor.constraint(equalTo: resistorView.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupRingView() {
        resistorView.addSubview(ringOneView)
        resistorView.addSubview(ringTwoView)
        resistorView.addSubview(ringThreeView)
        resistorView.addSubview(ringFourView)
        
        ringOneView.backgroundColor = .white
        ringTwoView.backgroundColor = .white
        ringThreeView.backgroundColor = .white
        ringFourView.backgroundColor = .white
        
        setupRingViewContriant()
    }
    
    func setupRingViewContriant() {
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
        
    }
    
    func setupLineImageView() {
        view.addSubview(lineImageView)
        lineImageView.image = UIImage(named: "Line@3x.png")
        setupLineImageViewContriant()
    }
    
    func setupLineImageViewContriant() {
        lineImageView.translatesAutoresizingMaskIntoConstraints = false
        lineImageView.topAnchor.constraint(equalTo: resistorView.bottomAnchor, constant: -6).isActive = true
        lineImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        lineImageView.widthAnchor.constraint(equalToConstant: 512).isActive = true
        lineImageView.heightAnchor.constraint(equalToConstant: 68).isActive = true
        
    }
    
    func getRingColor() {
        resistorRings[0] = .green
        resistorRings[1] = .green
        resistorRings[2] = .gold
        resistorRings[3] = .gold
        
        for i in 0...3 {
            rings[i] = colorToValue(ringColor: resistorRings[i], ringType: ringsType[i])
            print(rings[i])
        }
        
        let resistance = calculateResistance(rings: rings)
        
        let resistanceString = "\(resistance) ± \(rings[3])%  Ω"
        print(resistanceString)
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
            case .orang:
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
            case .orang:
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
            case .orang:
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

//PlaygroundPage.current.liveView = MyViewController()
