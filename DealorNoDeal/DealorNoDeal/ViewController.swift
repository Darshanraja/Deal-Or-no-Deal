//
//  ViewController.swift
//  DealorNoDeal
//
//  Created by Darshan Raja on 29/01/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var DealButton: UIButton!
    
    @IBOutlet weak var NoDeal: UIButton!
    var count=1
    var count1 = 0
    var shuffsuitcases: [String]?
    var suitcases=["1","10","50","100","300","1000","10000","50000","100000","500000"]
    var cases=4
    var mainarray = [0]
    func shufflesuitcases(){
        suitcases.shuffle()
        count = count+1
    }
    var buttonpressedornot = [10000]
    let TotalAmount = 661461
    let TotalCases = 10

    @IBAction func DealAction(_ sender: Any) {
        MainLabel.text = "You have Won \(sum)!!"
        NoDeal.isEnabled = false
    }
    
    var MainCount = 1
    @IBAction func NoDealAction(_ sender: Any) {
        MainCount = MainCount + 1
        if MainCount == 2
        {
            cases = 4
            DealButton.isHidden = true
            NoDeal.isHidden = true
            MainLabel.text = "Choose \(cases) Cases"
        }
        else if MainCount == 3
        {
            cases = 1
            DealButton.isHidden = true
            NoDeal.isHidden = true
            MainLabel.text = "Choose \(cases) Cases"
            MainCount = MainCount + 1
        }
        
    }
    @IBOutlet weak var Value10: UIImageView!
    
    @IBOutlet weak var Value1: UIImageView!
    
    @IBOutlet weak var Value50: UIImageView!
    
    @IBOutlet weak var Value100: UIImageView!
    
    @IBOutlet weak var Value300: UIImageView!
    
    @IBOutlet weak var Value1000: UIImageView!
    
    @IBOutlet weak var Value10000: UIImageView!
    
    @IBOutlet weak var Value50000: UIImageView!
    
    @IBOutlet weak var Value100000: UIImageView!
    
    @IBOutlet weak var Value500000: UIImageView!
    func open_reward(_ value2:String)
    {
        print(value2)
        let value = Int(value2)
        print("This is the value \(value!)")
        if value! == 1
        {
            Value1.image = UIImage(named: "reward_open_1")
        }
        else if value! == 10
        {
            Value10.image = UIImage(named: "reward_open_10")
        }
        else if value! == 50
        {
            Value50.image = UIImage(named: "reward_open_50")
        }
        else if value! == 100
        {
            Value100.image = UIImage(named: "reward_open_100")
        }
        else if value! == 300
        {
            Value300.image = UIImage(named: "reward_open_300")
        }
        else if value! == 1000
        {
            Value1000.image = UIImage(named: "reward_open_1000")
        }
        else if value! == 10000
        {
            Value10000.image = UIImage(named: "reward_open_10000")
        }
        else if value! == 50000
        {
            Value50000.image = UIImage(named: "reward_open_50000")
        }
        else if value! == 100000
        {
            Value100000.image = UIImage(named: "reward_open_100000")
        }
        else if value! == 500000
        {
            Value500000.image = UIImage(named: "reward_open_500000")
        }
    }
    var sum = 0
    func calculate()
    {
        print("Has entered Calculate")
        if MainCount == 4
        {
            sum = 0
            for i in mainarray
            {
                sum = sum + i
            }
            sum = TotalAmount - sum
            MainLabel.text = "You won \(sum)!"
            DealButton.isHidden = true
            NoDeal.isHidden = true
        }
        else
        {
            sum = 0
            for i in mainarray
            {
                sum = sum + i
            }
            sum = TotalAmount - sum
            print(mainarray)
            print(sum)
            sum = sum/(TotalCases-((mainarray.count)-1))
            print("The divided sum is \(sum)")
            sum = Int(0.6 * Double(sum))
            print("The Multiplied sum is \(sum)")
            MainLabel.text = "Bank Offer \(sum)!!"
        }
    }
    @IBAction func SuitcaseButton(_ sender: Any) {
        let buttonclicked = sender as! UIButton
        let tag : Int = buttonclicked.tag
        
        if cases>=0
        {
            print("THE VALUE OF CASES \(cases)")
            
            
            if (buttonpressedornot.contains(tag))
            {
                print("Button found")
                
            }
            else
            {
                MainLabel.text="Choose \(cases-1) Cases"
                cases = cases-1
                buttonpressedornot.append(tag)
                if count == 1
                {
                    shufflesuitcases()
                }
                buttonclicked.configuration?.background.image = UIImage(named: (suitcases[count1]))
                print("Button number \(tag) has this value \(suitcases[count1])")
                mainarray.append(Int(suitcases[count1]) ?? 0)
                print(mainarray)
                open_reward(suitcases[count1])
                count1=count1+1
                
            }
            if (cases == 0)
            {
                cases=cases-1
                print(cases)
                DealButton.isHidden=false
                NoDeal.isHidden = false
                calculate()
            }
            
        }
    }
    
    @IBAction func ResetAction(_ sender: Any) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let window = windowScene.windows.first {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let initialViewController = storyboard.instantiateInitialViewController()
                    window.rootViewController = initialViewController
                }
    }
    
}

