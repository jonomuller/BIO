//
//  rotor.m
//  BIO2008Q2
//
//  Created by Jono Muller on 30/11/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import "rotor.h"

@implementation rotor

@synthesize left, right;

- (void)initialise:(id)object position:(int)i
{
    left = [[NSMutableArray alloc] init];
}

- (void)turn
{
    for (int i = 0; i < 4; i++) {
        if ([[left objectAtIndex:i] isEqualToString:@"A"]) {
            [left replaceObjectAtIndex:i withObject:@"D"];
        } else if ([[left objectAtIndex:i] isEqualToString:@"B"]) {
            [left replaceObjectAtIndex:i withObject:@"A"];
        } else if ([[left objectAtIndex:i] isEqualToString:@"C"]) {
            [left replaceObjectAtIndex:i withObject:@"B"];
        } else if ([[left objectAtIndex:i] isEqualToString:@"D"]) {
            [left replaceObjectAtIndex:i withObject:@"C"];
        }
    }
    
    NSString *temp = [left objectAtIndex:0];
    [left removeObjectAtIndex:0];
    [left insertObject:temp atIndex:3];
}

- (id)getPosition:(char)letter
{
    id output;
    switch (letter) {
        case 'A':
            output = [left objectAtIndex:0];
            break;
        case 'B':
            output = [left objectAtIndex:1];
            break;
        case 'C':
            output = [left objectAtIndex:2];
            break;
        case 'D':
            output = [left objectAtIndex:3];
            break;
        default:
            break;
    }
    return output;
}

- (NSString *)getLetter:(NSUInteger)position
{
    NSString *output;
    switch (position) {
        case 0:
            output = @"A";
            break;
        case 1:
            output = @"B";
            break;
        case 2:
            output = @"C";
            break;
        case 3:
            output = @"D";
            break;
        default:
            break;
    }
    return output;
}

@end
