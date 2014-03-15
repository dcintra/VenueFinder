//
//  ViewController.h
//  VenueFinder
//
//  Created by Daniel Cintra on 2/14/14.
//  Copyright (c) 2014 Daniel Cintra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SearchViewController.h"
@import CoreLocation;


typedef NS_ENUM(int, LocationStatus){
    LocationStatusLoading,
    LocationStatusLoaded
};

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) NSString *query;
@property(assign)CLLocationCoordinate2D currLoc;
@end