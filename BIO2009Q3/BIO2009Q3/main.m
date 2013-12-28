//
//  main.m
//  BIO2009Q3
//
//  Created by Jono Muller on 05/12/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import <Foundation/Foundation.h>

NSMutableArray *arrangements;

void work(int sum)
{
    NSMutableString *test = [[NSMutableString alloc] init];
    
//    int tempSum = 0;
//    
//    for (int i = 1; i < 9; i++) {
//        for (int j = 1; j <= sum; j++) {
//            tempSum+=i;
//            [test appendString:[NSString stringWithFormat:@"%d", i]];
//            NSLog(@"test: %@", test);
//            if (tempSum == sum) {
//                if (![arrangements containsObject:test]) {
//                    [arrangements addObject:[test mutableCopy]];
//                    NSLog(@"%@", arrangements);
//                    [test setString:@""];
//                    tempSum = 0;
//                }
//            }
//        }
//    }
    
    [test setString:@"1"];
    [arrangements addObject:test];
    NSMutableArray *one = [[NSMutableArray alloc] init];
    [arrangements addObject:one];
    
    [test insertString:[NSString stringWithFormat:@"%d", 1] atIndex:0];
    [arrangements addObject:[NSString stringWithFormat:@"%d", 1+1]];
    NSLog(@"%@", arrangements);
    
    
}

void initialise()
{
    int sum = 0, noOfArrangement = 0;
    scanf("%d %d", &sum, &noOfArrangement);
    arrangements = [[NSMutableArray alloc] init];
    work(sum);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        initialise();
        
    }
    return 0;
}

