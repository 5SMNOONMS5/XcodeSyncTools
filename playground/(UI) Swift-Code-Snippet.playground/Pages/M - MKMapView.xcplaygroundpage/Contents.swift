

import UIKit
import MapKit
import Contacts
import AddressBook

class Map: UIViewController {
  
  var myAnnotations = [MyAnnotations]()
  var locationManager = CLLocationManager()
  var lastLocation : CLLocation?
  var myLocationFlag = true
  
  let mapView = MKMapView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //打點
    let pin = MyAnnotations(title: "台南文化中心",
      address: "台南市東區中華東路三段332號",
      coordinate: CLLocationCoordinate2D(latitude: 22.974487, longitude: 120.221671))
    mapView.addAnnotation(pin)
    
    mapView.delegate = self
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    checkLocationAuthorizationStatus()
  }
  
  // MARK: - location manager to authorize user location for Maps app
  func checkLocationAuthorizationStatus() {
    //使用者允許使用定位功能
    if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
      mapView.showsUserLocation = true
      //開始持續更新使用者位置
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.startUpdatingLocation()
    }
  }
  
  let regionRadius: CLLocationDistance = 1000
  func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius * 2.0, regionRadius * 2.0)
    mapView.setRegion(coordinateRegion, animated: true)
  }
}

class MyAnnotations: NSObject,MKAnnotation {
  
  let title: String?
  let address: String
  let coordinate: CLLocationCoordinate2D
  
  init(title: String, address: String, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.address = address
    self.coordinate = coordinate
    
    super.init()
  }
  
  var subtitle: String? {
    return address
  }
  
  // annotation callout info button opens this mapItem in Maps app
  func mapItem() -> MKMapItem {
    //        let addressDictionary = [String(kABPersonAddressStreetKey): subtitle]
    let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
    let mapItem = MKMapItem(placemark: placemark)
    
    return mapItem
  }
}

// MARK: - MKMapViewDelegate
extension Map: MKMapViewDelegate{
  
  func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
    
    if let annotation = annotation as? MyAnnotations {
      let identifier = "pin"
      var view: MKPinAnnotationView
      if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
        as? MKPinAnnotationView {
          dequeuedView.annotation = annotation
          view = dequeuedView
      } else {
        view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        view.canShowCallout = true
        view.calloutOffset = CGPoint(x: -5, y: 5)
        view.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure) as UIView
      }
      return view
    }
    return nil
  }
  
  //點擊氣泡框的按鈕
  func mapView(mapView: MKMapView, annotationView view: MKAnnotationView,
    calloutAccessoryControlTapped control: UIControl) {
      
      //導航
      let location = view.annotation as! MyAnnotations
      let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
      location.mapItem().openInMapsWithLaunchOptions(launchOptions)
  }
}

// MARK: - CLLocationManagerDelegate
extension Map : CLLocationManagerDelegate{
  //持續更新使用者位置
  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let location = locations.last
    lastLocation = CLLocation(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
    //畫面移動到使用者位置(只做一次)
    if myLocationFlag {
      centerMapOnLocation(lastLocation!)
      myLocationFlag = false
    }
  }
}




