//
//  ViewController.swift
//  RandomNameGenerator
//
//  Created by Esteban Ordonez on 1/8/19.
//  Copyright © 2019 Esteban Ordonez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameGenerated: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let yob2017:String = "test";
        let documentDirURL = try!FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true);
        let fileURL = documentDirURL.appendingPathComponent(yob2017).appendingPathExtension("txt");
        print("File Path \(fileURL.path)");
        let fileURLproject = Bundle.main.path(forResource: "yob2017", ofType: "txt");
        var readStringProject = "";
        
        do{
            readStringProject = try String(contentsOfFile: fileURLproject!, encoding: .utf8);
            
        } catch  let error as NSError {
            print("failed to read from project");
            print(error);
        }
        print(readStringProject);
        print("end of vdl");
        
    }
    
    
    @IBAction func generateName(_ sender: UIButton) {
        
        do {
            let filename: String = Bundle.main.path(forResource: "yob2017", ofType: "txt")!
            let contentsOfFile: String = try String(contentsOfFile: filename, encoding: .utf8);
            var names: [String] = contentsOfFile.components(separatedBy: "\n");
            names = names.filter {!$0.isEmpty}   //Remove the empty names (e.g., the last one).
            print("Read \(names.count) non-empty names.");
            let r: Int = Int.random(in: 0 ..< names.count);
            nameGenerated.text = names[r];
        } catch {
            print("couldn't read file names.txt: \(error)");
        }
    }
}






