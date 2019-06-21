//
//  MainVC.swift
//  ArithmeticTest
//
//  Created by Yuni on 2019/3/5.
//  Copyright © 2019 Yuni. All rights reserved.
//

import UIKit

struct CalculateNums {
    var addBase: Int
    var addNum: Int
    var subBase: Int
    var subNum: Int
    var mulBase: Int
    var mulNum: Int
    var divBase: Int
    var divNum: Int
    var powBase: Int
    var powNum: Int
}

class MainVC: UIViewController {
    @IBOutlet weak var addLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var mulLabel: UILabel!
    @IBOutlet weak var divLabel: UILabel!
    @IBOutlet weak var powLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nums = CalculateNums.init(addBase: 10, addNum: 20,
                                  subBase: 40, subNum: 30,
                                  mulBase: 50, mulNum: 60,
                                  divBase: 100, divNum: 20,
                                  powBase: 70, powNum: 2)
        updateLabels(nums: nums)
    }
    
    func addition(num: Int, addNum: Int) -> Int {
        return num + addNum
    }
    
    func subtraction(num: Int, subNum: Int) -> Int {
        return num - subNum
    }
    
    func multiplication(num: Int, mulNum: Int) -> Int {
        return num * mulNum
    }
    
    func division(num: Int, divNum: Int) -> Int {
        return num / divNum
    }
    
    func power(base: Int, exponent: Int) -> Int {
        return Int(pow(Double(base), Double(exponent)))
    }
    
    func updateLabels(nums: CalculateNums) {
        addLabel.text = String(format: "%i + %i = %i", nums.addBase, nums.addNum, addition(num: nums.addBase, addNum: nums.addNum))
        subLabel.text = String(format: "%i - %i = %i", nums.subBase, nums.subNum, subtraction(num: nums.subBase, subNum: nums.subNum))
        mulLabel.text = String(format: "%i * %i = %i", nums.mulBase, nums.mulNum, multiplication(num: nums.mulBase, mulNum: nums.mulNum))
        divLabel.text = String(format: "%i / %i = %i", nums.divBase, nums.divNum, division(num: nums.divBase, divNum: nums.divNum))
        powLabel.text = String(format: "%i ^ %i = %i", nums.powBase, nums.powNum, power(base: nums.powBase, exponent: nums.powNum))
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NextVC") as! NextVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
