//
//  MapAnnotation.h
//  VenueFinder
//
//  Created by Daniel Cintra on 2/16/14.
//  Copyright (c) 2014 Daniel Cintra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject <MKAnnotation>{
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
}

//coordinate
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
//title
@property   (nonatomic, copy) NSString *title;
//subtitle
@property   (nonatomic, copy) NSString *subtitle;
@property MKAnnotationView *v;

- initWithPosition:(CLLocationCoordinate2D)coords;

@end
