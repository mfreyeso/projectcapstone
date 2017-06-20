//
//  SitesViewController.swift
//  ProjectCapstone
//
//  Created by Mario Reyes Ojeda on 19/06/17.
//  Copyright © 2017 Mario Reyes Ojeda. All rights reserved.
//

import UIKit

class SitesViewController: UIViewController {

    @IBOutlet weak var siteLabelMain: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        siteLabelMain.text = "It's a Proof of Concept of QR, VR, Maps and GPS"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
