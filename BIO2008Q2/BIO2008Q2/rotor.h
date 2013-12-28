//
//  rotor.h
//  BIO2008Q2
//
//  Created by Jono Muller on 30/11/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface rotor : NSMutableArray

@property NSMutableArray *left;
@property NSMutableArray *right;

- (void)initialise:(id)object position:(int)i;
- (void)turn;
- (id)getPosition:(char)letter;
- (NSString *)getLetter:(NSUInteger)position;
@end
