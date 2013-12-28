//
//  jug.h
//  BIO2010Q3
//
//  Created by Jono Muller on 03/12/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface jug : NSObject
{
    NSMutableArray *levels;
}

@property int capacity;
@property int level;

- (void)initiialise;
- (void)fill;
- (void)empty;
- (void)pour:(jug *)otherJug;
- (void)print;

@end
