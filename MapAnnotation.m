//
//  MapAnnotation.m
//  VenueFinder
//
//  Created by Daniel Cintra on 2/16/14.
//  Copyright (c) 2014 Daniel Cintra. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;
@synthesize v;

- (id)initWithPosition:(CLLocationCoordinate2D)coords {
    if(self = [super init]) {
        self.coordinate = coords;
    }
    
    return self;
}




@end
