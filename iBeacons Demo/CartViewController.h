//
//  CartViewController.h
//  iBeacons Demo
//
//  Created by Omar Sheshtawy on 07/05/14.
//  Copyright (c) 2014 Mobient. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

UIImageView *shirtCart;
UIImageView *shirtCheckout;
UIImageView *pantsCart;
UIImageView *pantsCheckout;

@interface CartViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *cartOpen;

@property (weak, nonatomic) IBOutlet UILabel *beaconFoundLabel;
@property (weak, nonatomic) IBOutlet UILabel *proximityUUIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *majorLabel;
@property (weak, nonatomic) IBOutlet UILabel *minorLabel;
@property (weak, nonatomic) IBOutlet UILabel *accuracyLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *rssiLabel;

@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;

@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;


+ (int)shirtCounter;

@end
