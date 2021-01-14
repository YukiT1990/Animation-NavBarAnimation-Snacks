//
//  ViewController.swift
//  NavbarAnimation
//
//  Created by Yuki Tsukada on 2021/01/13.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let navigationBar: UIView = UIView()
    let addButton: UIButton = UIButton()
    let stackView: UIStackView = UIStackView()
    let tableView: UITableView = UITableView()

    var plusButtonTapped = false
    var selectedItems: [String] = []
//    var selectedItems: [String] = ["Oreos", "Pizza Pockets", "Pop Tarts", "Popsicle", "Ramen"]
    var imageView1TappedStorage = false
    var imageView2TappedStorage = false
    var imageView3TappedStorage = false
    var imageView4TappedStorage = false
    var imageView5TappedStorage = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationBarFunc()
        stackViewFunc()
        setupTableView()
    }
    

    

    func navigationBarFunc() {
        let width = self.view.frame.width
        let originalFrame = CGRect(x: 0, y: 0, width: width, height: 88)
        
        navigationBar.backgroundColor = UIColor(hex: "#DDDDDD")
        navigationBar.frame = originalFrame
        
        addButton.setTitle("＋", for: .normal)
        addButton.setTitleColor(UIColor(hex: "#32a4a8"), for: .normal)
        addButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 30)

        addButton.addTarget(self, action: #selector(self.addTapped(sender:)), for: .touchUpInside)
        addButton.frame = CGRect(x: width - 50, y: 45, width: 40, height: 40)
        
        self.view.addSubview(navigationBar)
        self.view.addSubview(addButton)

    }
    
    func stackViewFunc() {
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        // UILayoutGuide did not work well
        self.navigationBar.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalTo: navigationBar.heightAnchor, multiplier: 1),
            stackView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1)
            
        ])
        
        let imageView1 = UIImageView()
        let imageView2 = UIImageView()
        let imageView3 = UIImageView()
        let imageView4 = UIImageView()
        let imageView5 = UIImageView()
        imageView1.image = UIImage(named: "oreos")
        imageView2.image = UIImage(named: "pizza_pockets")
        imageView3.image = UIImage(named: "pop_tarts")
        imageView4.image = UIImage(named: "popsicle")
        imageView5.image = UIImage(named: "ramen")
        stackView.addArrangedSubview(imageView1)
        stackView.addArrangedSubview(imageView2)
        stackView.addArrangedSubview(imageView3)
        stackView.addArrangedSubview(imageView4)
        stackView.addArrangedSubview(imageView5)
        NSLayoutConstraint.activate([
            imageView1.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.45),
            imageView1.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            imageView2.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.45),
            imageView2.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            imageView3.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.45),
            imageView3.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            imageView4.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.45),
            imageView4.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            imageView5.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.45),
            imageView5.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor)
        ])
        
        // image 1
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(self.imageView1Tapped))

        imageView1.isUserInteractionEnabled = true
        imageView1.addGestureRecognizer(tapGestureRecognizer1)
        
        // image 2
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(self.imageView2Tapped))

        imageView2.isUserInteractionEnabled = true
        imageView2.addGestureRecognizer(tapGestureRecognizer2)
        
        // image 3
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(self.imageView3Tapped))

        imageView3.isUserInteractionEnabled = true
        imageView3.addGestureRecognizer(tapGestureRecognizer3)
        
        // image 4
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(self.imageView4Tapped))

        imageView4.isUserInteractionEnabled = true
        imageView4.addGestureRecognizer(tapGestureRecognizer4)
        
        // image 5
        let tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(self.imageView5Tapped))

        imageView5.isUserInteractionEnabled = true
        imageView5.addGestureRecognizer(tapGestureRecognizer5)
        
        stackView.isHidden = true
        let space1 = UILayoutGuide()
        stackView.addLayoutGuide(space1)
        
    }
    
    // image 1
    @objc func imageView1Tapped(sender: UIImage) {
        print("Oreos tapped!")
        if imageView1TappedStorage == false {
            selectedItems.append("Oreos")
            imageView1TappedStorage = true
            
        } else {
            selectedItems = selectedItems.filter(){$0 != "Oreos"}
            imageView1TappedStorage = false
        }
        tableView.reloadData()
    }
    
    // image 2
    @objc func imageView2Tapped(sender: UIImage) {
        print("Pizza Pockets tapped!")
        if imageView2TappedStorage == false {
            selectedItems.append("Pizza Pockets")
            imageView2TappedStorage = true
            
        } else {
            selectedItems = selectedItems.filter(){$0 != "Pizza Pockets"}
            imageView2TappedStorage = false
        }
        tableView.reloadData()
    }
    
    // image 3
    @objc func imageView3Tapped(sender: UIImage) {
        print("Pop Tarts tapped!")
        if imageView3TappedStorage == false {
            selectedItems.append("Pop Tarts")
            imageView3TappedStorage = true
            
        } else {
            selectedItems = selectedItems.filter(){$0 != "Pop Tarts"}
            imageView3TappedStorage = false
        }
        tableView.reloadData()
    }
    
    // image 4
    @objc func imageView4Tapped(sender: UIImage) {
        print("Popsicle tapped!")
        if imageView4TappedStorage == false {
            selectedItems.append("Popsicle")
            imageView4TappedStorage = true
            
        } else {
            selectedItems = selectedItems.filter(){$0 != "Popsicle"}
            imageView4TappedStorage = false
        }
        tableView.reloadData()
    }
    
    // image 5
    @objc func imageView5Tapped(sender: UIImage) {
        print("Ramen tapped!")
        if imageView5TappedStorage == false {
            selectedItems.append("Ramen")
            imageView5TappedStorage = true
            
        } else {
            selectedItems = selectedItems.filter(){$0 != "Ramen"}
            imageView5TappedStorage = false
        }
        tableView.reloadData()
    }
    
    
    
    @objc func addTapped(sender: UIButton) {

        let rotateTransform = CGAffineTransform(rotationAngle: .pi/4)
        
        if plusButtonTapped == false {
            plusButtonTapped = true
        } else {
            plusButtonTapped = false
        }
        /**
         dampingRatio -> Employ a damping ratio closer to zero to increase oscillation.
         */
        UIView.animate(withDuration: 1.0, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 10) {
            // items are shown
            if self.plusButtonTapped == true {
                self.stackView.isHidden = false
                self.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200)
                self.addButton.transform = rotateTransform
                self.tableView.frame = CGRect(x: self.tableView.frame.origin.x, y: self.tableView.frame.origin.y + 112, width: self.tableView.frame.size.width, height: self.tableView.contentSize.height)
                self.stackView.frame = CGRect(x: self.stackView.frame.origin.x, y: self.stackView.frame.origin.y + 112, width: self.stackView.frame.size.width, height: self.stackView.frame.size.height)
            // items are not shown
            } else {
                self.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 88)
                self.stackView.isHidden = true
                self.addButton.transform = .identity
                self.tableView.frame = CGRect(x: self.tableView.frame.origin.x, y: self.tableView.frame.origin.y - 112, width: self.tableView.frame.size.width, height: self.tableView.contentSize.height)
            }
        }
    }
    
    func setupTableView() {
        // required
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return selectedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath  as IndexPath)
      cell.textLabel?.text = selectedItems[indexPath.row]
      return cell
    }

}

