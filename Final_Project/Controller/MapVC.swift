//
//  MapVC.swift
//  Final_Project
//
//  Created by Eylon Ben David on 27/02/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import  MapKit
import CoreLocation

class MapVC: UIViewController , CLLocationManagerDelegate {

   
    
    let alert = UIAlertController(title: "Add new running location", message: "Enter description", preferredStyle: .alert)
    
    //Map
    @IBOutlet weak var map: MKMapView!
    
    var annotations = [Annotaion]()


    //Locations
    
    var myLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
    
    let manager = CLLocationManager()
    
    let clickedLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        let span : MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        
        myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let region : MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        
        map.setRegion(region, animated: true)
        self.map.showsUserLocation = true
        
        
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        manager.delegate = self
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        manager.requestWhenInUseAuthorization()
        
        manager.startUpdatingLocation()
        
        

    
        // Do any additional setup after loading the view, typically from a nib.
        
        alert.addTextField { (textField) in
            
            textField.text = ""
            
        }
        
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            
        }))
        
        Model.instance.getAllAnnotation { (annotationss) in
            
            if annotationss != nil {
                self.annotations = annotationss!
                
                for fbAnnotation in self.annotations {
                    
                    let newAnnotation = MKPointAnnotation()
                    
                    newAnnotation.coordinate.latitude = fbAnnotation.lat!
                    
                    newAnnotation.coordinate.longitude = fbAnnotation.long!
                    newAnnotation.title = fbAnnotation.text
                    self.map.addAnnotation(newAnnotation)
                    
                }
                
            }
            
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
   
    @IBAction func addButton(_ sender: Any) {
        addAnnotation()
    }
    

    
    func addAnnotation(){
        
        var anno : Annotaion?
        
        let textField = self.alert.textFields![0]
        let annotation = MKPointAnnotation()
        annotation.coordinate = self.myLocation
        annotation.title = textField.text
        
    
        self.present(alert, animated: true, completion: nil)
        annotation.title = textField.text
        print(annotation.title)
        self.map.addAnnotation(annotation)
        
        
        anno = Annotaion(long: annotation.coordinate.longitude, lat: annotation.coordinate.latitude, text: annotation.title!)
        Model.instance.addAnnotationToDB(annotation: anno!)
        annotations.append(anno!)

        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            
            let position = touch.location(in: view)
            print(position)
            
            myLocation = map.convert(position, toCoordinateFrom: map)
        
            
        }
        
    }
    
    

}
