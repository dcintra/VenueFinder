//
//  ViewController.m
//  VenueFinder
//
//  Created by Daniel Cintra on 2/14/14.
//  Copyright (c) 2014 Daniel Cintra. All rights reserved.
//

#import "ViewController.h"
#import <COMSMapManager/COMSMapManager.h>
#import "MapAnnotation.h"
@import CoreLocation;

@interface ViewController ()

@property(nonatomic, strong)NSMutableArray *dataSource;
@property(nonatomic, strong)NSDictionary *details;
;
@property(assign)LocationStatus currentLocationStatus;
@property(nonatomic, strong)MKPointAnnotation *annotation;
@property(nonatomic, strong)CLLocationManager *locationManager;

@end


@implementation ViewController




- (void)awakeFromNib {
    
    //put logo image in the navigationBar
    
    UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    self.navigationItem.titleView = img;
    
    
}



-(void)viewDidLoad

{
    [super viewDidLoad];
    
    NSLog(@"%@", _query);
	// Do any additional setup after loading the view, typically from a nib.
    _locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;

    [self.locationManager startUpdatingLocation];

    //Show User Location on map
      [self.mapView.delegate self];
      [self.mapView setShowsUserLocation:TRUE];
    
    [_mapView setUserTrackingMode:MKUserTrackingModeFollow];
    
    
      self.dataSource = [[NSMutableArray alloc]init];
      self.details = [[NSDictionary alloc] init];


    NSLog(@"number of points %i", self.dataSource.count);
    //Perform Search and get location data
    
    [self getData:^{
        
        int i =1;
        
        while (i < self.dataSource.count) {
            _details = self.dataSource[i];
            
            NSLog(@" %@", self.details);
            
            //    //Add Annotation to map
            NSMutableArray *annotations = [[NSMutableArray alloc] init];
            MapAnnotation *annotation;
            
            
            //create coordinate
            NSNumber *lat = self.details[@"geometry"][@"location"][@"lat"];
            NSNumber *lng = self.details[@"geometry"][@"location"][@"lng"];
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake([lat doubleValue], [lng doubleValue]);
            //create annotation
            
            annotation = [MapAnnotation new];
            annotation.coordinate = coord;
            annotation.title = self.details[@"name"];
            annotation.subtitle = self.details[@"vicinity"];
           
            MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 800, 800);
            [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
            
            //add annotation to map
            [annotations addObject:annotation];
            [self.mapView addAnnotations: annotations];
            
            i++;
        }
       
        //reset query
        _query = nil;
        
    }];
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
}

//perform query to retrieve data about locations

-(void)getData:(void(^)())completion{
    
    //40.758557, -73.985031

   
    
    CLLocationCoordinate2D location;
    location.latitude = 40.758557;
    location.longitude = -73.985031;
    
    
   NSLog(@"location %f",_currLoc.latitude);
    NSLog(@"query %@",_query);


    [GoogleMapManager nearestVenuesForLatLong:location withinRadius:500 forQuery: _query queryType:nil googleMapsAPIKey:@"AIzaSyDFuUDUhdTLk_WNs390u9kRSqZ3IDBGmJ8" searchCompletion:^(NSMutableArray *results) {
        
        //clear before adding data, so we get expected results
        
        [self.dataSource removeAllObjects];
        [self.dataSource addObjectsFromArray:results];
        
        
        //reflect changes
        completion();
    }];
    
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
