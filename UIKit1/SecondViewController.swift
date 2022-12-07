import UIKit

final class SecondViewController: UIViewController {
    
    private let viewBlack: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 120, y: 200, width: 150, height: 400)
        view.backgroundColor = .black
        return view
    }()
    
    private let viewRed: UIView = {
        let viewOne = UIView()
        viewOne.translatesAutoresizingMaskIntoConstraints = false
        viewOne.frame = CGRect(x: 145, y: 225, width: 100, height: 100)
        viewOne.backgroundColor = .red
        return viewOne
    }()
    
    private let viewYellow: UIView = {
        let viewTwo = UIView()
        viewTwo.translatesAutoresizingMaskIntoConstraints = false
        viewTwo.frame = CGRect(x: 145, y: 350, width: 100, height: 100)
        viewTwo.backgroundColor = .yellow
        return viewTwo
    }()
    
    private let viewGreen: UIView = {
        let viewThree = UIView()
        viewThree.translatesAutoresizingMaskIntoConstraints = false
        viewThree.frame = CGRect(x: 145, y: 475, width: 100, height: 100)
        viewThree.backgroundColor = .green
        return viewThree
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        forView()
    }
    
    private func createBlackViewConstraints() {
        NSLayoutConstraint(item: viewBlack,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: viewBlack,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: viewBlack,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 150).isActive = true
        NSLayoutConstraint(item: viewBlack,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 400).isActive = true
    }
    
    private func createRedViewConstraints() {
        NSLayoutConstraint(item: viewRed,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: viewBlack,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: viewRed,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: viewBlack,
                           attribute: .top,
                           multiplier: 1,
                           constant: 120).isActive = true
        NSLayoutConstraint(item: viewRed,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
        NSLayoutConstraint(item: viewRed,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
    }
    
    private func createYellowViewConstraints() {
        NSLayoutConstraint(item: viewYellow,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: viewBlack,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: viewYellow,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: viewBlack,
                           attribute: .top,
                           multiplier: 1,
                           constant: 250).isActive = true
        NSLayoutConstraint(item: viewYellow,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
        NSLayoutConstraint(item: viewYellow,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
    }
    
    private func createGreenViewConstraints() {
        NSLayoutConstraint(item: viewGreen,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: viewBlack,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: viewGreen,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: viewBlack,
                           attribute: .top,
                           multiplier: 1,
                           constant: 380).isActive = true
        NSLayoutConstraint(item: viewGreen,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
        NSLayoutConstraint(item: viewGreen,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
    }
    
    private func forView() {
        view.addSubview(viewBlack)
        view.addSubview(viewRed)
        view.addSubview(viewYellow)
        view.addSubview(viewGreen)
        
        createBlackViewConstraints()
        createRedViewConstraints()
        createYellowViewConstraints()
        createGreenViewConstraints()
    }
}
