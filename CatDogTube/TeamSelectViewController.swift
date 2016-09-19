//
//  TeamSelectViewController.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/18.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class TeamSelectViewController: UIViewController {

    static let name = "TeamSelectViewController"
    
    private var teamSelectDeleagte: TeamSelectDelegate?
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func set(teamSelectDelegate: TeamSelectDelegate) {
        self.teamSelectDeleagte = teamSelectDelegate
    }
    
    @IBAction func onCatSelected(_ sender: AnyObject) {
        teamSelectDeleagte?.onTeamSelected(team: Team(teamName: .catTeam))
        teamSelectDeleagte = nil
    }

    @IBAction func onDogSelected(_ sender: AnyObject) {
        teamSelectDeleagte?.onTeamSelected(team: Team(teamName: .dogTeam))
        teamSelectDeleagte = nil
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
