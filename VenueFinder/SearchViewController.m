//
//  SearchViewController.m
//  VenueFinder
//
//  Created by Daniel Cintra on 2/17/14.
//  Copyright (c) 2014 Daniel Cintra. All rights reserved.
//

#import "SearchViewController.h"
#import <MapKit/MapKit.h>

@interface SearchViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property(assign)CLLocationCoordinate2D currentLocation;
@property(assign)CLLocationCoordinate2D currLoc;
@property(readonly)MKUserLocation *userLocation;
@property(nonatomic, strong)CLLocationManager *locationManager;


@end

@implementation SearchViewController


- (void)awakeFromNib {
    
    //put logo image in the navigationBar
    
    UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    self.navigationItem.titleView = img;

    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


//retrieve search bar information to pass on to View Controller
-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _query = searchBar.text;
    [self performSegueWithIdentifier:@"DisplaySearchResults" sender:self];
    
    
}


//pass information to ViewController
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ViewController *ViewController = [segue destinationViewController];
    ViewController.query = _query;
    ViewController.currLoc = _currLoc;

}

//remove keyboard when user touches the screen elsewhere

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"nysmall1.png"]]];

	// Do any additional setup after loading the view.
    
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
