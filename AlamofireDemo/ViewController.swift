//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by china on 15/10/27.
//  Copyright © 2015年 china. All rights reserved.
//

import Alamofire
import SwiftyJSON
import UIKit


class ViewController: UIViewController {

    @IBAction func swiftyjsonClick(sender: AnyObject) {
        testJSONResponse()
    }
    
     
    @IBOutlet weak var dataTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      
        self.dataTextView.text="";

    }

    
    func testJSONResponse() {
        
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
            .responseSwiftyJSON({ (request, response, json,  error) in
                
                if((error) != nil){
                    print("获取数据失败")
                    print(error)

                    return
                }
                
                print("i=====%@",json)
                
                print("origin-=---",json["origin"]);
                
                print("headers-=---",json["headers"]["User-Agent"]);

                self.dataTextView.text=String(json );


            })
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getRequestClick(sender: AnyObject) {
        
        //下载下一次所需的启动页数据
        Alamofire.request(.GET, "https://httpbin.org/get").responseJSON { (_, _, dataResult) -> Void in
            guard dataResult.error == nil else {
                print("获取数据失败")
                return
            }
            print(dataResult.value);
            
            
            print("origin-=---",JSON(dataResult.value!)["origin"]);
            print("headers-=---",JSON(dataResult.value!)["headers"]["User-Agent"]);

            self.dataTextView.text=String(JSON(dataResult.value!));

            
        }
        
    }
    
       

    
    @IBAction func postRequestClick(sender: AnyObject) {
        
        
        Alamofire.request(.POST, "https://httpbin.org/post").responseJSON { (_, _ , dataResult) -> Void in
            
            guard dataResult.error==nil else{
            
            print("数据获取失败")
                return
            }
            print(String(JSON(dataResult.value!)));
            
            print("origin-=---",JSON(dataResult.value!)["origin"]);
            print("headers-=---",JSON(dataResult.value!)["headers"]["User-Agent"]);

            self.dataTextView.text=String(JSON(dataResult.value!));


            
        }
        
        
        
    }
    
    
    @IBAction func downloadClick(sender: AnyObject) {
        
//        Alamofire.download(.GET, "https://httpbin.org/stream/1", destination: destination)
    }
    
    

}

