//
//  Clock.h
//  BIO2013Q1
//
//  Created by Jono Muller on 24/11/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Clock : NSObject

@property int currentTime;
@property int minsFast;
@property int hours;
@property int minutes;

- (int)setHours;
- (int)setMinutes;
- (int)setMinsFast;
- (int)getTime;

@end
