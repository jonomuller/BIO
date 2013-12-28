//
//  main.m
//  BIO2010Q3
//
//  Created by Jono Muller on 03/12/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "jug.h"

jug *jug1;
jug *jug2;
jug *jug3;

//NSMutableArray *levels;

void numberOfSteps(int amount)
{
    int steps = 0;
    if (([jug1 level] == amount) || ([jug2 level] == amount) || ([jug3 level] == amount)) {
        NSLog(@"%d", steps);
    } else {
        [jug1 fill];
    }
    
        [jug1 fill];
        [jug1 empty];
        [jug1 pour:jug2];
        [jug1 pour:jug3];
        [jug2 fill];
        [jug2 empty];
        [jug2 pour:jug1];
        [jug2 pour:jug3];
        [jug3 fill];
        [jug3 empty];
        [jug3 pour:jug1];
        [jug3 pour:jug2];
    
    [jug1 print];
    
    
}

void initialise()
{
    int numberOfJugs = 0, amountToMeasure = 0, jug1Capacity = 0, jug2Capacity = 0, jug3Capacity = 0;
    scanf("%d %d", &numberOfJugs, &amountToMeasure);
    
    switch (numberOfJugs) {
        case 1:
            scanf("%d", &jug1Capacity);
            break;
        case 2:
            scanf("%d %d", &jug1Capacity, &jug2Capacity);
            break;
        case 3:
            scanf("%d %d %d", &jug1Capacity, &jug2Capacity, &jug3Capacity);
            break;
        default:
            break;
    }
    
//    levels = [[NSMutableArray alloc] init];
    
    jug1 = [[jug alloc] init];
    jug2 = [[jug alloc] init];
    jug3 = [[jug alloc] init];
    
    [jug1 setCapacity:jug1Capacity];
    [jug2 setCapacity:jug2Capacity];
    [jug3 setCapacity:jug3Capacity];
    
    numberOfSteps(amountToMeasure);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        initialise();
        
    }
    return 0;
}

