//
//  main.m
//  BIO1998Q1
//
//  Created by Jono Muller on 10/12/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import <Foundation/Foundation.h>

char getNumeral(int number)
{
    switch (number) {
        case 1:
            return 'I';
            break;
        case 5:
            return 'V';
            break;
        case 10:
            return 'X';
            break;
        case 50:
            return 'L';
            break;
        case 500:
            return 'D';
            break;
        case 1000:
            return 'M';
            break;
        default:
            break;
    }
    return number;
}

void output(int number)
{
    NSLog(@"%c", getNumeral(number));
}

void work(int number)
{
    int temp = 0;
    for (int i = 0; i < number; i++) {
        temp = number / i;
    }
}

void initialise()
{
    int input = 0;
    scanf("%d", &input);
    work(input);
    output(input);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        initialise();
        
    }
    return 0;
}

