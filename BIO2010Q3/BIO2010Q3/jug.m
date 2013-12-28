//
//  jug.m
//  BIO2010Q3
//
//  Created by Jono Muller on 03/12/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import "jug.h"

@implementation jug

@synthesize capacity, level;

- (void)initiialise
{
    levels = [[NSMutableArray alloc] init];
}

- (void)fill
{
    level = capacity;
    [levels addObject:[[NSNumber numberWithInt:level] mutableCopy]];
}

-(void)empty
{
    level = 0;
    [levels addObject:[[NSNumber numberWithInt:level] mutableCopy]];
}

-(void)pour:(jug *)otherJug
{
    level = level - ([otherJug capacity] - [otherJug level]);
    [levels addObject:[[NSNumber numberWithInt:level] mutableCopy]];
}

- (void)print
{
    NSLog(@"%@", levels);
}

@end
