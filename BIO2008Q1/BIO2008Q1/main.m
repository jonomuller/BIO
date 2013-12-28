//
//  main.m
//  BIO2008Q1
//
//  Created by Jono Muller on 28/11/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import <Foundation/Foundation.h>

NSMutableArray *primes;

void getPrimes()
{
    bool isPrime;
    for (int i = 2; i < 10000; i++) {
        isPrime = TRUE;
        for (int j = 2; j < i; j++) {
            if ((i % j) == 0) {
                isPrime = FALSE;
            }
        }
        if (isPrime) {
            NSNumber *number = [NSNumber numberWithInt:i];
            [primes addObject:number];
        }
    }
}

int numberOfWays(NSNumber *number)
{
    int numOfWays = 0;
    
    for (int i = 0; i < [primes count]; i++) {
        for (int j = 0; j < [primes count]; j++) {
            if (([number intValue] - [[primes objectAtIndex:i] intValue]) == [[primes objectAtIndex:j] intValue]) {
                numOfWays++;
            }
        }
    }
    
    numOfWays = (numOfWays+1) / 2;
    return numOfWays;
}

void initialise()
{
    primes = [[NSMutableArray alloc] init];
    getPrimes();
    int input = 0;
    scanf("%d", &input);
    NSNumber *number = [NSNumber numberWithInt:input];
    NSLog(@"%d", numberOfWays(number));
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        initialise();
        
    }
    return 0;
}

