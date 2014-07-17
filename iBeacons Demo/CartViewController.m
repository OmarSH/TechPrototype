//
//  CartViewController.m
//  iBeacons Demo
//
//  Created by Omar Sheshtawy on 07/05/14.
//  Copyright (c) 2014 Mobient. All rights reserved.
//

#import "CartViewController.h"

@interface CartViewController ()



@end

@implementation CartViewController


static int shirtCounter;
+ (int)shirtCounter { return shirtCounter; }

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self initRegion];
    [self locationManager:self.locationManager didStartMonitoringForRegion:self.beaconRegion];
    shirtCounter = 0;
    self.leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:self.leftSwipeGestureRecognizer];

}

- (IBAction)openCart:(id)sender {
    UIImageView *cartOpen = (UIImageView *)[self.view viewWithTag:7];
    
    [UIView transitionWithView:cartOpen
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        cartOpen.alpha = 1.0;
                    }
                    completion:^(BOOL finished){
                        
                    }];
}

- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionDown)
    {
        UIImageView *cartOpen = (UIImageView *)[self.view viewWithTag:7];
        
        [UIView transitionWithView:cartOpen
                          duration:0.5
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            cartOpen.alpha = 0.0;
                        }
                        completion:^(BOOL finished){
                            
                        }];
    }
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}

- (void)initRegion {
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"];
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid
                                                           identifier:@"com.devfright.myRegion"];
    
    [self.locationManager startMonitoringForRegion:self.beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"Beacon Found");
    // [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"Left Region");
    //  [self.locationManager stopRangingBeaconsInRegion:self.beaconRegion];
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
        
        
        NSLog(@"%i", shirtCounter);
        if (closestBeacon.proximity == CLProximityImmediate) {
            if (shirtCounter == 0){
                
                NSString *test = [NSString stringWithFormat:@"%@", closestBeacon.major];
                NSLog(@"%@", test);
                
                if ( [test isEqual: @"11264"]){
                    NSLog(@"MINT Immediate");
                    self.distanceLabel.text = @"Immediate MINT";
                    
                    UIImageView *cartBG = (UIImageView *)[self.view viewWithTag:3];
                    
                    [UIView transitionWithView:cartBG
                                      duration:0.5
                                       options:UIViewAnimationOptionTransitionCrossDissolve
                                    animations:^{
                                        cartBG.alpha = 1.0;
                                    }
                                    completion:^(BOOL finished){
                                        
                                    }];
                    
                    UIButton *cartButton = (UIButton *)[self.view viewWithTag:4];
                    
                    [UIView transitionWithView:cartButton
                                      duration:0.5
                                       options:UIViewAnimationOptionTransitionCrossDissolve
                                    animations:^{
                                        cartButton.alpha = 1.0;
                                    }
                                    completion:^(BOOL finished){
                                        
                                    }];
                    
                    UIButton *cartItem1 = (UIButton *)[self.view viewWithTag:5];
                    
                    [UIView transitionWithView:cartItem1
                                      duration:0.5
                                       options:UIViewAnimationOptionTransitionCrossDissolve
                                    animations:^{
                                        cartItem1.alpha = 1.0;
                                    }
                                    completion:^(BOOL finished){
                                        
                                    }];
                    
                    
                    shirtCounter = 1;
          }
                
            } else if(shirtCounter == 1){
                CLBeacon *closestBeacon = beacons[1];
                
                 if (closestBeacon.proximity == CLProximityImmediate) {
                
                     NSString *test = [NSString stringWithFormat:@"%@", closestBeacon.major];
                     NSLog(@"hij logt nu de paarse %@", test);
           
                     if ([test isEqual: @"21844"]){
                         NSLog(@"purple");
                         self.distanceLabel.text = @"Immediate Purple";
                
                         UIImageView *cartItem2 = (UIImageView *)[self.view viewWithTag:6];
                         
                         [UIView transitionWithView:cartItem2
                                           duration:0.5
                                            options:UIViewAnimationOptionTransitionCrossDissolve
                                         animations:^{
                                             cartItem2.alpha = 1.0;
                                         }
                                         completion:^(BOOL finished){
                                             
                                         }];
                        
                         shirtCounter = 2;
             
                     }
                 }
            }
        } else if (closestBeacon.proximity == CLProximityNear) {
            
          
            
            NSString *test = [NSString stringWithFormat:@"%@", closestBeacon.major];
            NSLog(@"%@", test);
            
            if ( [test isEqual: @"11264"]){
                NSLog(@"MINT Near");
                if(shirtCounter == 1){
                    UIImageView *cartBG = (UIImageView *)[self.view viewWithTag:3];
                    
                    [UIView transitionWithView:cartBG
                                      duration:0.5
                                       options:UIViewAnimationOptionTransitionCrossDissolve
                                    animations:^{
                                        cartBG.alpha = 0.0;
                                    }
                                    completion:^(BOOL finished){
                                        
                                    }];
                    
                    UIButton *cartButton = (UIButton *)[self.view viewWithTag:4];
                    
                    [UIView transitionWithView:cartButton
                                      duration:0.5
                                       options:UIViewAnimationOptionTransitionCrossDissolve
                                    animations:^{
                                        cartButton.alpha = 0.0;
                                    }
                                    completion:^(BOOL finished){
                                        
                                    }];
                    
                    UIImageView *cartItem1 = (UIImageView *)[self.view viewWithTag:5];
                    
                    [UIView transitionWithView:cartItem1
                                      duration:0.5
                                       options:UIViewAnimationOptionTransitionCrossDissolve
                                    animations:^{
                                        cartItem1.alpha = 0.0;
                                    }
                                    completion:^(BOOL finished){
                                        
                                    }];
                    
                    
                    shirtCounter = 0;
                }

            }
            else if ([test isEqual: @"21844"]){
                if(shirtCounter == 2){
                    UIImageView *cartItem2 = (UIImageView *)[self.view viewWithTag:6];
                    
                    [UIView transitionWithView:cartItem2
                                      duration:0.5
                                       options:UIViewAnimationOptionTransitionCrossDissolve
                                    animations:^{
                                        cartItem2.alpha = 0.0;
                                    }
                                    completion:^(BOOL finished){
                                        
                                    }];
                    
                    shirtCounter = 1;
                }
            }
            
        }
    } else {
        // no beacons in range - signal may have been lost
        // optionally hide previously displayed proximity based information
        self.distanceLabel.text = @"no beacon in range";
        
        NSLog(@"walk to the purple one :D");
    }
    
    
    
   // self.rssiLabel.text = [NSString stringWithFormat:@"%i", beacon.rssi];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
