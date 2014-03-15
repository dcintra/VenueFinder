//
//  SearchViewController.h
//  VenueFinder
//
//  Created by Daniel Cintra on 2/17/14.
//  Copyright (c) 2014 Daniel Cintra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface SearchViewController : UIViewController <UISearchBarDelegate, MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) NSString *query;
@property (strong, nonatomic) CLLocation *location;
@end
