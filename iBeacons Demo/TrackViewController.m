//
//  TrackViewController.m
//  iBeacons Demo
//
//  Created by M Newill on 27/09/2013.
//  Copyright (c) 2013 Mobient. All rights reserved.
//

#import "TrackViewController.h"

@interface TrackViewController ()

@end

@implementation TrackViewController

static int counter;
+ (int)counter { return counter; }

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self initRegion];
    [self locationManager:self.locationManager didStartMonitoringForRegion:self.beaconRegion];
    counter = 0;
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}

- (void)initRegion {
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"];
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid  identifier:@"com.devfright.myRegion"];
    self.beaconRegion.notifyEntryStateOnDisplay = YES;
    
    [self.locationManager startMonitoringForRegion:self.beaconRegion];
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
                         
    
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"Beacon Found");
   [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"Left Region");
    [self.locationManager stopRangingBeaconsInRegion:self.beaconRegion];
    self.beaconFoundLabel.text = @"No";
}

-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    CLBeacon *beacon = [[CLBeacon alloc] init];
    beacon = [beacons lastObject];

    // identify closest beacon in range
    if ([beacons count] > 0) {
        CLBeacon *closestBeacon = beacons[0];
        
        self.beaconFoundLabel.text = @"Yes";
        self.proximityUUIDLabel.text = closestBeacon.proximityUUID.UUIDString;
        self.majorLabel.text = [NSString stringWithFormat:@"%@", closestBeacon.major];
        self.minorLabel.text = [NSString stringWithFormat:@"%@", closestBeacon.minor];
        self.accuracyLabel.text = [NSString stringWithFormat:@"%f", closestBeacon.accuracy];

        NSString *test = [NSString stringWithFormat:@"%@", closestBeacon.major];
        NSLog(@"%@", test);
        
       if (closestBeacon.proximity == CLProximityNear) {
            // detect other nearby beacons
            // optionally hide previously displayed proximity based information
            
            if ( [test isEqual: @"39199"]){
                 NSLog(@"Blue near");
                
                    UIButton *notificationButton = (UIButton *)[self.view viewWithTag:2];
                
                
                    [UIView transitionWithView:notificationButton
                                      duration:0.5
                                       options:UIViewAnimationOptionTransitionCrossDissolve
                                    animations:^{
                                        notificationButton.alpha = 1.0;
                                    }
                                    completion:^(BOOL finished){
                                        
                                    }];
                
             }

       } else if (closestBeacon.proximity == CLProximityFar) {

           if ( [test isEqual: @"39199"]){
               NSLog(@"Blue Immediate");
               UIButton *notificationButton = (UIButton *)[self.view viewWithTag:2];
               notificationButton.alpha = 0.0;
               [UIView transitionWithView:notificationButton
                                 duration:0.5
                                  options:UIViewAnimationOptionTransitionCrossDissolve
                               animations:^{
                                   notificationButton.alpha = 0.0;
                               }
                               completion:^(BOOL finished){
                                   
                               }];
           }

        

           
       } else if (closestBeacon.proximity == CLProximityFar) {
          
           }
     

    } 
    
    
    else {
        // no beacons in range - signal may have been lost
        // optionally hide previously displayed proximity based information
        self.distanceLabel.text = @"no beacon in range";
    }
    
    
       self.rssiLabel.text = [NSString stringWithFormat:@"%i", beacon.rssi];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
