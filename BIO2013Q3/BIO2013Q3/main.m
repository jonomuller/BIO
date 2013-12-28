//
//  main.m
//  BIO2013Q3
//
//  Created by Jono Muller on 27/11/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import <Foundation/Foundation.h>

int keypad[5][5];

int exchange(int input)
{
    switch (input) {
        case 0:
            return 1;
            break;
            
        case 1:
            return 2;
            break;
            
        case 2:
            return 0;
            break;
            
        default:
            break;
    }
    return input;
}

void updateKeypad(int i, int j)
{
    keypad[i][j] = exchange(keypad[i][j]);
    keypad[i-1][j] = exchange(keypad[i-1][j]);
    keypad[i+1][j] = exchange(keypad[i+1][j]);
    keypad[i][j-1] = exchange(keypad[i][j-1]);
    keypad[i][j+1] = exchange(keypad[i][j+1]);
}

int checkIfZero()
{
    int output = 0;
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            if (keypad[i][j] == 0) {
                output++;
            }
        }
    }
    return output;
}

void sequence()
{
    while (checkIfZero() != 25) {
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                while (keypad[i][j] != 0) {
                    updateKeypad(i, j);
                }
            }
        }
    }
    printf("\n");
}

void initialise()
{
    char input[12];
    scanf("%s", input);
    NSString *inputString = [NSString stringWithUTF8String:input];
    
    for (int i = 0; i < [inputString length]; i++) {
        int ascii = [inputString characterAtIndex:i];
        if (ascii > 96) {
            keypad[(ascii-97) / 5][(ascii - 97) % 5] = 1;
        } else {
            keypad[(ascii-65) / 5][(ascii - 65) % 5] = 2;
        }
    }
    
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            printf("%d", keypad[i][j]);
            if (j == 4) {
                printf("\n");
            }
        }
    }
    printf("\n");
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        initialise();
        sequence();
        
//      Output array to screen
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                printf("%d", keypad[i][j]);
                if (j == 4) {
                    printf("\n");
                }
            }
        }
        printf("\n");
        
    }
    return 0;
}

