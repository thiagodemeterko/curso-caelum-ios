//
//  ContatosNoMapaViewController.swift
//  ContatosIP67v2
//
//  Created by ios8106 on 25/03/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

import UIKit
import MapKit

class ContatosNoMapaViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapa:MKMapView!
    let locationManager = CLLocationManager()
    var contatos: [Contato] = Array()
    let dao:ContatoDAO = ContatoDAO.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapa.delegate = self
        
        self.locationManager.requestWhenInUseAuthorization()
        
        let botaoLocalizacao = MKUserTrackingBarButtonItem(mapView: self.mapa)
        
        self.navigationItem.rightBarButtonItem = botaoLocalizacao

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.contatos = dao.listarTodos()
        self.mapa.addAnnotations(self.contatos)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.mapa.removeAnnotations(self.contatos)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        let identifier:String = "pino"
        
        var pino:MKPinAnnotationView
        
        if let reusablePin =  mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
            pino = reusablePin
        } else {
            pino = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        if let contato = annotation as? Contato {
            pino.pinTintColor = UIColor.red
            pino.canShowCallout = true
            
            let frame = CGRect(x:0.0, y:0.0, width:32.0, height:32.0)
            let imagemContato = UIImageView(frame: frame)
            
            imagemContato.image = contato.foto
            
            pino.leftCalloutAccessoryView = imagemContato
        }
        
        return pino
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        // get the particular pin that was tapped
        let pinToZoomOn = view.annotation
        
        // optionally you can set your own boundaries of the zoom
        let span = MKCoordinateSpanMake(0.02, 0.02)
        
        // now move the map
        mapView.setRegion(MKCoordinateRegion(center: pinToZoomOn!.coordinate, span: span), animated: true)
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
