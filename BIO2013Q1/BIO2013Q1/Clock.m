//
//  Clock.m
//  BIO2013Q1
//
//  Created by Jono Muller on 24/11/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import "Clock.h"

@implementation Clock

@synthesize currentTime, minsFast, hours, minutes;

- (int)setHours
{
    hours = currentTime / 60;
    if (hours == 24) {
        hours = 0;
    }
    return hours;
}

- (int)setMinutes
{
    minutes = currentTime % 60;
    return minutes;
}

- (int)setMinsFast
{
    return minsFast;
}

- (int)getTime
{
    currentTime = currentTime + 60 + minsFast;
    if (currentTime > 1440) {
        currentTime = currentTime % 1440;
    }
    return currentTime;
}

@end
