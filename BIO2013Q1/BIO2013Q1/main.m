//
//  main.m
//  BIO2013Q1
//
//  Created by Jono Muller on 24/11/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Clock.h"

int minsFastFirst, minsFastSecond;
Clock *firstClock, *secondClock;

void output()
{
    [firstClock setHours];
    [firstClock setMinutes];
    
    NSLog(@"%02d:%2d", [firstClock hours], [firstClock minutes]);
    
    exit(0);
}

void initialise()
{
    firstClock = [[Clock alloc] init];
    secondClock = [[Clock alloc] init];
    
    scanf("%d %d", &minsFastFirst, &minsFastSecond);
    
    [firstClock setMinsFast:minsFastFirst];
    [secondClock setMinsFast:minsFastSecond];
    
    while (0==0) {
        if ([firstClock getTime] == [secondClock getTime]) {
            output();
        }
    }
}

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        initialise();
        
    }
    return 0;
}

