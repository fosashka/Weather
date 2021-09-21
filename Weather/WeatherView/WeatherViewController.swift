//
//  WeatherViewController.swift
//  Weather
//
//  Created by Александр Фоминых on 02.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol WeatherDisplayLogic: AnyObject {
    func displayData(viewModel: Weather.Model.ViewModel.ViewModelData)
}

class WeatherViewController: UIViewController, WeatherDisplayLogic {
    
    var interactor: WeatherBusinessLogic?
    var router: (NSObjectProtocol & WeatherRoutingLogic)?
    
    private var tableHeader: TableHeader = TableHeader()
    
    
    @IBOutlet weak var table: UITableView!
    
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = WeatherInteractor()
        let presenter             = WeatherPresenter()
        let router                = WeatherRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: Routing
    
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        table.delegate = self
        table.dataSource = self
        
        table.backgroundColor = .clear
        view.backgroundColor = #colorLiteral(red: 0.1333316236, green: 0.4177086425, blue: 1, alpha: 1)
        
        interactor?.makeRequest(request: Weather.Model.Request.RequestType.getCurrentWeather)
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        table.tableHeaderView = tableHeader
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tableHeader.frame.size.height = view.frame.size.width
    }
    
    func displayData(viewModel: Weather.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayCurrentWeather(weatherViewModel: let weatherViewModel):
            setBackground(image: weatherViewModel.weatherMainConditionGroup)
            tableHeader.set(viewModel: weatherViewModel)
        }
    }
    
    private func setBackground(image: UIImage) {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = image
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.text = String(indexPath.row)
        return cell
    }
}
