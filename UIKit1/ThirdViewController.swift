import UIKit

final class ThirdViewController: UIViewController {
    
    private let viewBlack: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private let viewRed: UIView = {
        let viewOne = UIView()
        viewOne.translatesAutoresizingMaskIntoConstraints = false
        viewOne.backgroundColor = .red
        return viewOne
    }()
    
    private let viewYellow: UIView = {
        let viewTwo = UIView()
        viewTwo.translatesAutoresizingMaskIntoConstraints = false
        viewTwo.backgroundColor = .yellow
        return viewTwo
    }()
    
    private let viewGreen: UIView = {
        let viewThree = UIView()
        viewThree.translatesAutoresizingMaskIntoConstraints = false
        viewThree.backgroundColor = .green
        return viewThree
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        forView()
    }
    
    private func createBlackViewConstraints() {
        viewBlack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewBlack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        viewBlack.heightAnchor.constraint(equalToConstant: 400).isActive = true
        viewBlack.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func createRedViewConstraints() {
        viewRed.rightAnchor.constraint(equalTo: viewYellow.rightAnchor).isActive = true
        viewRed.leftAnchor.constraint(equalTo: viewYellow.leftAnchor).isActive = true
        viewRed.bottomAnchor.constraint(equalTo: viewYellow.topAnchor, constant: -30).isActive = true
        viewRed.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func createYellowViewConstraints() {
        viewYellow.centerYAnchor.constraint(equalTo: viewBlack.centerYAnchor).isActive = true
        viewYellow.centerXAnchor.constraint(equalTo: viewBlack.centerXAnchor).isActive = true
        viewYellow.heightAnchor.constraint(equalToConstant: 100).isActive = true
        viewYellow.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func createGreenViewConstraints() {
        viewGreen.rightAnchor.constraint(equalTo: viewYellow.rightAnchor).isActive = true
        viewGreen.leftAnchor.constraint(equalTo: viewYellow.leftAnchor).isActive = true
        viewGreen.topAnchor.constraint(equalTo: viewYellow.bottomAnchor, constant: 30).isActive = true
        viewGreen.heightAnchor.constraint(equalToConstant: 100).isActive = true
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
