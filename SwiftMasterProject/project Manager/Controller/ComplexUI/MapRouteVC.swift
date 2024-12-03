//
//  MapRouteVC.swift
//  SwiftMasterProject
//
//  Created by Potenza on 14/02/24.
//

import UIKit
import MapKit


//MARK: - CustomAnnotation Model
class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var imageName: String?

    init(coordinate: CLLocationCoordinate2D, title: String?, imageName: String?) {
        self.coordinate = coordinate
        self.title = title
        self.imageName = imageName
    }
}

//MARK: - CustomAnnotationView       
class CustomAnnotationView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let customAnnotation = newValue as? CustomAnnotation else { return }
            image = UIImage(named: customAnnotation.imageName ?? "")
        }
    }
}

class MapRouteVC: UIViewController {
    
    //MARK: - Ib_Outltes
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK: - Declarations
    let locationManager = CLLocationManager()
    var isFirstTime = true
    
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    //MARK: - SetUpUI
    func setUpUI() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.delegate = self
        mapView.showsUserLocation = true
    }
    
    //MARK: - Other Methods
    func drawRoute() {
        
        guard isFirstTime == false else {return}
            
        // Ensure that the location manager is set up and authorized
        guard let userLocation = locationManager.location?.coordinate else {
            print("User location not available.")
            return
        }

        // Replace with actual destination coordinates
        let destinationLocations: [CLLocationCoordinate2D] = [
            CLLocationCoordinate2D(latitude: 21.1925, longitude: 72.7979),
            CLLocationCoordinate2D(latitude: 21.2025, longitude: 72.8079),
            CLLocationCoordinate2D(latitude: 21.2025, longitude: 72.8100),
            
            // Add more destination coordinates as needed
        ]

        var annotations: [CustomAnnotation] = []

        // Add user's current location as an annotation
        let sourceAnnotation = CustomAnnotation(coordinate: userLocation, title: "Current Location", imageName: "")
        annotations.append(sourceAnnotation)

        // Add destination annotations
        for (index, destinationLocation) in destinationLocations.enumerated() {
            let destinationAnnotation = CustomAnnotation(coordinate: destinationLocation, title: "Destination \(index + 1)", imageName: "")
            annotations.append(destinationAnnotation)
        }

        mapView.addAnnotations(annotations)

        // Calculate directions for the entire route
        var waypoints: [MKMapItem] = []

        // Add user's location as the starting point
        waypoints.append(MKMapItem(placemark: MKPlacemark(coordinate: userLocation)))

        for destinationLocation in destinationLocations {
            waypoints.append(MKMapItem(placemark: MKPlacemark(coordinate: destinationLocation)))
        }

        for i in 0..<waypoints.count - 1 {
            let directionRequest = MKDirections.Request()
            directionRequest.source = waypoints[i]
            directionRequest.destination = waypoints[i + 1]
            directionRequest.transportType = .walking // You can change this to .walking or .transit

            let directions = MKDirections(request: directionRequest)
            directions.calculate { (response, error) in
                guard let response = response else {
                    if let error = error {
                        print("Error getting directions: \(error)")
                    }
                    return
                }

                for route in response.routes {
                    self.mapView.addOverlay(route.polyline, level: .aboveRoads)
                }

                let rect = response.routes.reduce(MKMapRect.null) { $0.union($1.polyline.boundingMapRect) }
                self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            }
        }
    }
}

//MARK: -  MapKit Delegate methods
extension MapRouteVC: MKMapViewDelegate, CLLocationManagerDelegate  {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor.blue
            renderer.lineWidth = 3.0
            return renderer
        }
        return MKOverlayRenderer()
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true )
            if isFirstTime == true {
                isFirstTime = false
            }
            drawRoute()
        }
    }
}
