//
//  main.m
//  BIO2008Q3
//
//  Created by Jono Muller on 28/11/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "queue.h"

queue *list;
NSMutableArray *shirt;

int hash(NSMutableArray *shirt)
{
    int storeLocation = 0;
    for (int i = 0; i < 7; i++) {
        storeLocation = storeLocation + ([[shirt objectAtIndex:i] intValue]*(i+1));
    }
    return storeLocation;
}

void moveRightToMiddle(int i, int j)
{
    NSMutableArray *tempShirt = [[[list stringArray] objectAtIndex:i] mutableCopy];
    NSString *temp = [tempShirt objectAtIndex:6];
    [tempShirt removeObjectAtIndex:6];
    [tempShirt insertObject:temp atIndex:3];
    [list enqueue:[tempShirt mutableCopy] counter:[NSNumber numberWithInt:j] storeLocation:hash(tempShirt)];
}

void moveLeftToMiddle(int i, int j)
{
    NSMutableArray *tempShirt = [[[list stringArray] objectAtIndex:i] mutableCopy];
    NSString *temp = [tempShirt objectAtIndex:0];
	[tempShirt removeObjectAtIndex:0];
    [tempShirt insertObject:temp atIndex:3];
    [list enqueue:[tempShirt mutableCopy] counter:[NSNumber numberWithInt:j] storeLocation:hash(tempShirt)];
}

void moveMiddleToRight(int i, int j)
{
    NSMutableArray *tempShirt = [[[list stringArray] objectAtIndex:i] mutableCopy];
    NSString *temp = [tempShirt objectAtIndex:3];
    [tempShirt removeObjectAtIndex:3];
    [tempShirt insertObject:temp atIndex:6];
    [list enqueue:[tempShirt mutableCopy] counter:[NSNumber numberWithInt:j] storeLocation:hash(tempShirt)];
}

void moveMiddleToLeft(int i, int j)
{
    NSMutableArray *tempShirt = [[[list stringArray] objectAtIndex:i] mutableCopy];
    NSString *temp = [tempShirt objectAtIndex:3];
    [tempShirt removeObjectAtIndex:3];
    [tempShirt insertObject:temp atIndex:0];
    [list enqueue:[tempShirt mutableCopy] counter:[NSNumber numberWithInt:j] storeLocation:hash(tempShirt)];
}

void operations()
{
    int ops = 0;
    int count = 0;
    float baseLog = log(4);
    NSMutableArray *sortedShirt = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", nil];
    for (int i = 0; i < 1000000000; i++) {
        
        float logCalc = log(i-count);
        if ((logCalc / baseLog) == ops) {
            ops++;
            count = i;
        }
        
        if (i == 1) {
            ops = 1;
        }
        
        moveRightToMiddle(i, ops);
        moveLeftToMiddle(i, ops);
        moveMiddleToRight(i, ops);
        moveMiddleToLeft(i, ops);
        
        if ([[[list stringArray] objectAtIndex:i] isEqualToArray:sortedShirt]) {
            NSLog(@"%@", [[list numArray] lastObject]);
            exit(0);
        }
    }
}

void initialise()
{
    list = [[queue alloc] init];
    char input[7];
    scanf("%s", input);
    NSString *inputString = [NSString stringWithUTF8String:input];
    shirt = [[NSMutableArray alloc] init];
    for (int i = 0; i < [inputString length]; i++) {
        [shirt addObject:[inputString substringWithRange:NSMakeRange(i, 1)]];
    }
    
    [list initialise];
    [list enqueue:[shirt mutableCopy] counter:[NSNumber numberWithInt:0] storeLocation:hash(shirt)];
    
    operations();
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        initialise();
        
    }
    return 0;
}

